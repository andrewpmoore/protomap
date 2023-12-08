// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_weather_areas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedWeatherAreas _$$_SavedWeatherAreasFromJson(Map<String, dynamic> json) =>
    _$_SavedWeatherAreas(
      id: json['id'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      provider: json['provider'] as String? ?? 'default',
      stationId: json['stationId'] as String,
      isFavourite: json['isFavourite'] as bool,
      isHome: json['isHome'] as bool,
      order: json['order'] as int,
    );

Map<String, dynamic> _$$_SavedWeatherAreasToJson(
        _$_SavedWeatherAreas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'provider': instance.provider,
      'stationId': instance.stationId,
      'isFavourite': instance.isFavourite,
      'isHome': instance.isHome,
      'order': instance.order,
    };
