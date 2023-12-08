// To parse this JSON data, do
//
//     final wundergroundSearchResults = wundergroundSearchResultsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'wunderground_search_results.freezed.dart';
part 'wunderground_search_results.g.dart';

WundergroundSearchResults wundergroundSearchResultsFromJson(String str) => WundergroundSearchResults.fromJson(json.decode(str));

String wundergroundSearchResultsToJson(WundergroundSearchResults data) => json.encode(data.toJson());

@freezed
abstract class WundergroundSearchResults with _$WundergroundSearchResults {
  const factory WundergroundSearchResults({
    required Location location,
  }) = _WundergroundSearchResults;

  factory WundergroundSearchResults.fromJson(Map<String, dynamic> json) => _$WundergroundSearchResultsFromJson(json);
}

@freezed
abstract class Location with _$Location {
  const factory Location({
    // required List<String> address,
    // required List<String> adminDistrict,
    // required List<String> adminDistrictCode,
    required List<String> city,
    required List<String> country,
    // required List<String> countryCode,
    required List<String> displayName,
    // required List<String> ianaTimeZone,
    required List<double> latitude,
    // required List<Locale> locale,
    required List<double> longitude,
    // required List<String> neighborhood,
    // required List<String> placeId,
    // required List<String> postalCode,
    // required List<String> postalKey,
    // required List<bool> disputedArea,
    // required List<dynamic> disputedCountries,
    // required List<dynamic> disputedCountryCodes,
    // required List<dynamic> disputedCustomers,
    // required List<List<bool>> disputedShowCountry,
    // required List<String> iataCode,
    // required List<String> icaoCode,
    // required List<String> locId,
    // required List<dynamic> locationCategory,
    required List<String> pwsId,
    // required List<String> type,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
abstract class Locale with _$Locale {
  const factory Locale({
    required dynamic locale1,
    required String locale2,
    required dynamic locale3,
    required String locale4,
  }) = _Locale;

  factory Locale.fromJson(Map<String, dynamic> json) => _$LocaleFromJson(json);
}
