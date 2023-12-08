// To parse this JSON data, do
//
//     final sevenTimerCivilLightForecast = sevenTimerCivilLightForecastFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'seven_timer_civil_light_forecast.freezed.dart';
part 'seven_timer_civil_light_forecast.g.dart';

SevenTimerCivilLightForecast sevenTimerCivilLightForecastFromJson(String str) => SevenTimerCivilLightForecast.fromJson(json.decode(str));

String sevenTimerCivilLightForecastToJson(SevenTimerCivilLightForecast data) => json.encode(data.toJson());

@freezed
class SevenTimerCivilLightForecast with _$SevenTimerCivilLightForecast {
  const factory SevenTimerCivilLightForecast({
    required String product,
    required String init,
    required List<Datasery> dataseries,
  }) = _SevenTimerCivilLightForecast;

  factory SevenTimerCivilLightForecast.fromJson(Map<String, dynamic> json) => _$SevenTimerCivilLightForecastFromJson(json);
}

@freezed
class Datasery with _$Datasery {
  const factory Datasery({
    required int date,
    required String weather,
    @JsonKey(name:'temp2m') Temp2M? temp2M,
    @JsonKey(name:'wind10m_max') double? wind10MMax,
  }) = _Datasery;

  factory Datasery.fromJson(Map<String, dynamic> json) => _$DataseryFromJson(json);
}

@freezed
class Temp2M with _$Temp2M {
  const factory Temp2M({
    double? max,
    double? min,
  }) = _Temp2M;

  factory Temp2M.fromJson(Map<String, dynamic> json) => _$Temp2MFromJson(json);
}
