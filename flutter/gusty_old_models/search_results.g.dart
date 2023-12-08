// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResults _$$_SearchResultsFromJson(Map<String, dynamic> json) =>
    _$_SearchResults(
      id: json['id'] as String,
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      url: json['url'] as String,
      type: json['type'] as String?,
      provider: json['provider'] as String?,
      stationId: json['stationId'] as String,
    );

Map<String, dynamic> _$$_SearchResultsToJson(_$_SearchResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'url': instance.url,
      'type': instance.type,
      'provider': instance.provider,
      'stationId': instance.stationId,
    };
