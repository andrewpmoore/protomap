// To parse this JSON data, do
//
//     final wundergroundTodayObservations = wundergroundTodayObservationsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'wunderground_today_observations.freezed.dart';
part 'wunderground_today_observations.g.dart';

WundergroundTodayObservations wundergroundTodayObservationsFromJson(String str) => WundergroundTodayObservations.fromJson(json.decode(str));

String wundergroundTodayObservationsToJson(WundergroundTodayObservations data) => json.encode(data.toJson());

@freezed
class WundergroundTodayObservations with _$WundergroundTodayObservations {
  const factory WundergroundTodayObservations({
    required List<Observation> observations,
  }) = _WundergroundTodayObservations;

  factory WundergroundTodayObservations.fromJson(Map<String, dynamic> json) => _$WundergroundTodayObservationsFromJson(json);
}

@freezed
class Observation with _$Observation {
  const factory Observation({
    @JsonKey(name: 'stationID') required String stationId,
    required String tz,
    required DateTime obsTimeUtc,
    required DateTime obsTimeLocal,
    required int epoch,
    required double lat,
    required double lon,
    double? solarRadiationHigh,
    double? uvHigh,
    double? winddirAvg,
    double? humidityHigh,
    double? humidityLow,
    double? humidityAvg,
    double? qcStatus,
    Map<String, double?>? metric,
  }) = _Observation;

  factory Observation.fromJson(Map<String, dynamic> json) => _$ObservationFromJson(json);
}
