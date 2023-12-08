import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lofi/src/constants.dart';
import 'package:lofi/src/scenes/scene_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SceneProvider extends ChangeNotifier {

  final Ref ref;

  Scene? _selectedScene;


  Map<String, AudioPlayer> _sceneAudioEffectPlayers = {};


  Map<String, AudioPlayer> get sceneAudioEffectPlayers => _sceneAudioEffectPlayers;

  set sceneAudioEffectPlayers(Map<String, AudioPlayer> value) {
    _sceneAudioEffectPlayers = value;
    notifyListeners();
  }

  Scene? get selectedScene => _selectedScene;


  void playToggleEffect(String name){
    for (Feature feature in _selectedScene!.features){
      if (feature.audio&&feature.name==name){
        if (sceneAudioEffectPlayers[feature.name]!.playing){
          sceneAudioEffectPlayers[feature.name]?.pause();
        }
        else{
          sceneAudioEffectPlayers[feature.name]?.setLoopMode(feature.audioLoop ? LoopMode.all : LoopMode.off);
          sceneAudioEffectPlayers[feature.name]?.play();
        }
      }
    }
  }

  void initialiseSceneAudioEffects() async {
    for (Feature feature in _selectedScene!.features){
      if (feature.audio){
         sceneAudioEffectPlayers[feature.name] = AudioPlayer();

         final playlist = ConcatenatingAudioSource(
           // Start loading next item just before reaching it
           useLazyPreparation: true,
           // Customise the shuffle algorithm
           shuffleOrder: DefaultShuffleOrder(random: Random(DateTime.now().millisecond)),
           // Specify the playlist items
           children: [
             for (String audioToPlay in feature.onFeatureState.audioToPlay) AudioSource.uri(Uri.parse(audioToPlay)),
           ],
         );
         await sceneAudioEffectPlayers[feature.name]?.setShuffleModeEnabled(true);
         await sceneAudioEffectPlayers[feature.name]?.setAudioSource(playlist, initialIndex: 0, initialPosition: Duration.zero);
         // final duration = await sceneAudioEffectPlayers[feature.name]?.setUrl('https://github.com/andrewpmoore/lofi/blob/main/1.mp3?raw=true');
      }
    }
  }

  void stopAllSceneAudio(){
    for (var effect in sceneAudioEffectPlayers.entries){
      effect.value.stop();
      effect.value.dispose();
    }
    _sceneAudioEffectPlayers.clear();
  }

  set selectedScene(Scene? value) {
    _selectedScene = value;
    notifyListeners();
  }

  SceneProvider(this.ref) {
    _init();
  }

  void _init() async{
    sceneList = List<Scene>.from(json.decode(await rootBundle.loadString('$jsonPath/scenes.json')).map((x) => Scene.fromJson(x)));
    final prefs = await SharedPreferences.getInstance();
    final String sceneName = prefs.getString('scene_name') ?? 'beach';
    for (Scene singleScene in sceneList){
      if (sceneName==singleScene.name){
        _selectedScene = singleScene;
        initialiseSceneAudioEffects();
        notifyListeners();
      }
    }
  }

  List<Scene> _sceneList = [];

  List<Scene> get sceneList => _sceneList;

  set sceneList(List<Scene> value) {
    _sceneList = value;
    notifyListeners();
  }

  void setSelectedScene(Scene scene) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('scene_name', scene.name);
    stopAllSceneAudio();
    selectedScene = scene;
    initialiseSceneAudioEffects();

  }


}