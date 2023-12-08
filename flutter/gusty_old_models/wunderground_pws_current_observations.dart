// To parse this JSON data, do
//
//     final wundergroundPwsCurrentObservations = wundergroundPwsCurrentObservationsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'wunderground_pws_current_observations.freezed.dart';
part 'wunderground_pws_current_observations.g.dart';

WundergroundPwsCurrentObservations wundergroundPwsCurrentObservationsFromJson(String str) => WundergroundPwsCurrentObservations.fromJson(json.decode(str));

String wundergroundPwsCurrentObservationsToJson(WundergroundPwsCurrentObservations data) => json.encode(data.toJson());

@freezed
class WundergroundPwsCurrentObservations with _$WundergroundPwsCurrentObservations {
  const factory WundergroundPwsCurrentObservations({
    required List<Observation> observations,
  }) = _WundergroundPwsCurrentObservations;

  factory WundergroundPwsCurrentObservations.fromJson(Map<String, dynamic> json) => _$WundergroundPwsCurrentObservationsFromJson(json);
}

@freezed
class Observation with _$Observation {
  const factory Observation({
    @JsonKey(name: 'stationID') String? stationId,
    DateTime? obsTimeUtc,
    DateTime? obsTimeLocal,
    String? neighborhood,
    String? softwareType,
    String? country,
    double? solarRadiation,
    double? lon,
    int? realtimeFrequency,
    int? epoch,
    double? lat,
    double? uv,
    int? winddir,
    int? humidity,
    int? qcStatus,
    Map<String, double>? metric,
  }) = _Observation;

  factory Observation.fromJson(Map<String, dynamic> json) => _$ObservationFromJson(json);
}
