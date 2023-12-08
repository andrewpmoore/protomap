// To parse this JSON data, do
//
//     final searchResults = searchResultsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'search_results.freezed.dart';
part 'search_results.g.dart';

List<SearchResults> searchResultsFromJson(String str) => List<SearchResults>.from(json.decode(str).map((x) => SearchResults.fromJson(x)));

String searchResultsToJson(List<SearchResults> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class SearchResults with _$SearchResults {
  const factory SearchResults({
    required String id,
    required String name,
    required String region,
    required String country,
    required double lat,
    required double lon,
    required String url,
    String? type,
    String? provider,
    required String stationId
  }) = _SearchResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) => _$SearchResultsFromJson(json);
}
