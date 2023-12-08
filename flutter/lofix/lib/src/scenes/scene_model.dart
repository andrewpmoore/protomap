// To parse this JSON data, do
//
//     final scene = sceneFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Scene> sceneFromJson(String str) => List<Scene>.from(json.decode(str).map((x) => Scene.fromJson(x)));

String sceneToJson(List<Scene> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Scene {
  Scene({
    required this.name,
    required this.description,
    required this.animationName,
    required this.features,
  });

  String name;
  String description;
  String animationName;
  List<Feature> features;

  factory Scene.fromJson(Map<String, dynamic> json) => Scene(
    name: json["name"],
    description: json["description"],
    animationName: json["animation_name"],
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "animation_name": animationName,
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
  };
}

class Feature {
  Feature({
    required this.name,
    required this.defaultState,
    required this.triggerName,
    required this.audio,
    required this.audioLoop,
    required this.offFeatureState,
    required this.onFeatureState,
  });

  String name;
  String defaultState;
  String triggerName;
  bool audio;
  bool audioLoop;
  FeatureState offFeatureState;
  FeatureState onFeatureState;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    name: json["name"],
    defaultState: json["default_state"],
    triggerName: json["trigger_name"],
    audio: json["audio"],
    audioLoop: json["audio_loop"],
    offFeatureState: FeatureState.fromJson(json["off_feature_state"]),
    onFeatureState: FeatureState.fromJson(json["on_feature_state"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "default_state": defaultState,
    "trigger_name": triggerName,
    "audio": audio,
    "audio_loop": audioLoop,
    "off_feature_state": offFeatureState.toJson(),
    "on_feature_state": onFeatureState.toJson(),
  };
}

class FeatureState {
  FeatureState({
    required this.animationStateName,
    required this.animationStateValue,
    required this.audioToPlay,
  });

  String animationStateName;
  int animationStateValue;
  List<String> audioToPlay;

  factory FeatureState.fromJson(Map<String, dynamic> json) => FeatureState(
    animationStateName: json["animation_state_name"],
    animationStateValue: json["animation_state_value"],
    audioToPlay: List<String>.from(json["audio_to_play"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "animation_state_name": animationStateName,
    "animation_state_value": animationStateValue,
    "audio_to_play": List<dynamic>.from(audioToPlay.map((x) => x)),
  };
}
