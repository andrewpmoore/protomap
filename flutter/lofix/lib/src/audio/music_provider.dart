import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lofi/src/constants.dart';
import 'package:lofi/src/scenes/scene_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';


class MusicProvider extends ChangeNotifier {

  final Ref ref;

  AudioPlayer _audioPlayer = AudioPlayer();


  AudioPlayer get audioPlayer => _audioPlayer;

  set audioPlayer(AudioPlayer value) {
    _audioPlayer = value;
  }

  MusicProvider(this.ref) {
    _init();
  }

  void _init() async{

  }



}