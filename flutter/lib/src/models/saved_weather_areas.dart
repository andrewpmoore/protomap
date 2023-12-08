// To parse this JSON data, do
//
//     final savedWeatherAreas = savedWeatherAreasFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'saved_weather_areas.freezed.dart';
part 'saved_weather_areas.g.dart';

List<SavedWeatherAreas> savedWeatherAreasFromJson(String str) => List<SavedWeatherAreas>.from(json.decode(str).map((x) => SavedWeatherAreas.fromJson(x)));

String savedWeatherAreasToJson(List<SavedWeatherAreas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SavedWeatherAreas with _$SavedWeatherAreas {
  const factory SavedWeatherAreas({
    required String id,
    required double lat,
    required double lon,
    required String name,
    required String region,
    required String country,
    // required String type,
    @Default('default') String provider,
    required String stationId,
    required bool isFavourite,
    required bool isHome,
    required int order,
  }) = _SavedWeatherAreas;

  factory SavedWeatherAreas.fromJson(Map<String, dynamic> json) => _$SavedWeatherAreasFromJson(json);
}
