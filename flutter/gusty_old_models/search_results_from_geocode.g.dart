// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results_from_geocode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResultsFromGeocode _$$_SearchResultsFromGeocodeFromJson(
        Map<String, dynamic> json) =>
    _$_SearchResultsFromGeocode(
      lat: json['lat'] as String,
      lon: json['lon'] as String,
      displayName: json['display_name'] as String,
      placeId: json['place_id'] as int,
    );

Map<String, dynamic> _$$_SearchResultsFromGeocodeToJson(
        _$_SearchResultsFromGeocode instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'display_name': instance.displayName,
      'place_id': instance.placeId,
    };
