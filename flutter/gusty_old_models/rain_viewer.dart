// To parse this JSON data, do
//
//     final rainViewer = rainViewerFromJson(jsonString);

// import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'rain_viewer.freezed.dart';
part 'rain_viewer.g.dart';

RainViewer rainViewerFromJson(String str) => RainViewer.fromJson(json.decode(str));

String rainViewerToJson(RainViewer data) => json.encode(data.toJson());

@freezed
abstract class RainViewer with _$RainViewer {
  const factory RainViewer({
    required String version,
    required int generated,
    required String host,
    required Radar radar,
    required Satellite satellite,
  }) = _RainViewer;

  factory RainViewer.fromJson(Map<String, dynamic> json) => _$RainViewerFromJson(json);
}

@freezed
abstract class Radar with _$Radar {
  const factory Radar({
    required List<Nowcast> past,
    required List<Nowcast> nowcast,
  }) = _Radar;

  factory Radar.fromJson(Map<String, dynamic> json) => _$RadarFromJson(json);
}

@freezed
abstract class Nowcast with _$Nowcast {
  const factory Nowcast({
    required int time,
    required String path,
  }) = _Nowcast;

  factory Nowcast.fromJson(Map<String, dynamic> json) => _$NowcastFromJson(json);
}

@freezed
abstract class Satellite with _$Satellite {
  const factory Satellite({
    required List<Nowcast> infrared,
  }) = _Satellite;

  factory Satellite.fromJson(Map<String, dynamic> json) => _$SatelliteFromJson(json);
}
