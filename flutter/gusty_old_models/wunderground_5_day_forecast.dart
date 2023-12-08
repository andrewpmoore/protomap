// To parse this JSON data, do
//
//     final wunderground5DayForecast = wunderground5DayForecastFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'wunderground_5_day_forecast.freezed.dart';
part 'wunderground_5_day_forecast.g.dart';

Wunderground5DayForecast wunderground5DayForecastFromJson(String str) => Wunderground5DayForecast.fromJson(json.decode(str));

String wunderground5DayForecastToJson(Wunderground5DayForecast data) => json.encode(data.toJson());

@freezed
class Wunderground5DayForecast with _$Wunderground5DayForecast {
  const factory Wunderground5DayForecast({
    List<double?>? calendarDayTemperatureMax,
    List<double?>? calendarDayTemperatureMin,
    List<String?>? dayOfWeek,
    List<double?>? expirationTimeUtc,
    List<String?>? moonPhase,
    List<String?>? moonPhaseCode,
    List<double?>? moonPhaseDay,
    List<String?>? moonriseTimeLocal,
    List<double?>? moonriseTimeUtc,
    List<String?>? moonsetTimeLocal,
    List<double?>? moonsetTimeUtc,
    List<String?>? narrative,
    List<double?>? qpf,
    List<double?>? qpfSnow,
    List<String?>? sunriseTimeLocal,
    List<double?>? sunriseTimeUtc,
    List<String?>? sunsetTimeLocal,
    List<double?>? sunsetTimeUtc,
    List<double?>? temperatureMax,
    List<double?>? temperatureMin,
    List<String?>? validTimeLocal,
    List<double?>? validTimeUtc,
    List<Daypart?>? daypart,
  }) = _Wunderground5DayForecast;

  factory Wunderground5DayForecast.fromJson(Map<String, dynamic> json) => _$Wunderground5DayForecastFromJson(json);
}

@freezed
class Daypart with _$Daypart {
  const factory Daypart({
    List<double?>? cloudCover,
    List<String?>? dayOrNight,
    List<String?>? daypartName,
    List<int?>? iconCode,
    List<int?>? iconCodeExtend,
    List<String?>? narrative,
    List<double?>? precipChance,
    List<String?>? precipType,
    List<double?>? qpf,
    List<double?>? qpfSnow,
    List<String?>? qualifierCode,
    List<String?>? qualifierPhrase,
    List<double?>? relativeHumidity,
    List<String?>? snowRange,
    List<double?>? temperature,
    List<double?>? temperatureHeatIndex,
    List<double?>? temperatureWindChill,
    List<String?>? thunderCategory,
    List<double?>? thunderIndex,
    List<String?>? uvDescription,
    List<double?>? uvIndex,
    List<double?>? windDirection,
    List<String?>? windDirectionCardinal,
    List<String?>? windPhrase,
    List<double?>? windSpeed,
    List<String?>? wxPhraseLong,
    List<String?>? wxPhraseShort,
  }) = _Daypart;

  factory Daypart.fromJson(Map<String, dynamic> json) => _$DaypartFromJson(json);
}
