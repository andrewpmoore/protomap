// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain_viewer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RainViewer _$$_RainViewerFromJson(Map<String, dynamic> json) =>
    _$_RainViewer(
      version: json['version'] as String,
      generated: json['generated'] as int,
      host: json['host'] as String,
      radar: Radar.fromJson(json['radar'] as Map<String, dynamic>),
      satellite: Satellite.fromJson(json['satellite'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RainViewerToJson(_$_RainViewer instance) =>
    <String, dynamic>{
      'version': instance.version,
      'generated': instance.generated,
      'host': instance.host,
      'radar': instance.radar,
      'satellite': instance.satellite,
    };

_$_Radar _$$_RadarFromJson(Map<String, dynamic> json) => _$_Radar(
      past: (json['past'] as List<dynamic>)
          .map((e) => Nowcast.fromJson(e as Map<String, dynamic>))
          .toList(),
      nowcast: (json['nowcast'] as List<dynamic>)
          .map((e) => Nowcast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RadarToJson(_$_Radar instance) => <String, dynamic>{
      'past': instance.past,
      'nowcast': instance.nowcast,
    };

_$_Nowcast _$$_NowcastFromJson(Map<String, dynamic> json) => _$_Nowcast(
      time: json['time'] as int,
      path: json['path'] as String,
    );

Map<String, dynamic> _$$_NowcastToJson(_$_Nowcast instance) =>
    <String, dynamic>{
      'time': instance.time,
      'path': instance.path,
    };

_$_Satellite _$$_SatelliteFromJson(Map<String, dynamic> json) => _$_Satellite(
      infrared: (json['infrared'] as List<dynamic>)
          .map((e) => Nowcast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SatelliteToJson(_$_Satellite instance) =>
    <String, dynamic>{
      'infrared': instance.infrared,
    };
