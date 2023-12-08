// To parse this JSON data, do
//
//     final searchResults = searchResultsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'search_results_from_geocode.freezed.dart';
part 'search_results_from_geocode.g.dart';

List<SearchResultsFromGeocode> searchResultsFromGeocodeFromJson(String str) => List<SearchResultsFromGeocode>.from(json.decode(str).map((x) => SearchResultsFromGeocode.fromJson(x)));

String searchResultsFromGeocodeToJson(List<SearchResultsFromGeocode> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SearchResultsFromGeocode with _$SearchResultsFromGeocode {
  const factory SearchResultsFromGeocode({
    required String lat,
    required String lon,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'place_id') required int placeId,
  }) = _SearchResultsFromGeocode;

  factory SearchResultsFromGeocode.fromJson(Map<String, dynamic> json) => _$SearchResultsFromGeocodeFromJson(json);
}
