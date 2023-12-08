// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wunderground_pws_current_observations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WundergroundPwsCurrentObservations
    _$$_WundergroundPwsCurrentObservationsFromJson(Map<String, dynamic> json) =>
        _$_WundergroundPwsCurrentObservations(
          observations: (json['observations'] as List<dynamic>)
              .map((e) => Observation.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_WundergroundPwsCurrentObservationsToJson(
        _$_WundergroundPwsCurrentObservations instance) =>
    <String, dynamic>{
      'observations': instance.observations,
    };

_$_Observation _$$_ObservationFromJson(Map<String, dynamic> json) =>
    _$_Observation(
      stationId: json['stationID'] as String?,
      obsTimeUtc: json['obsTimeUtc'] == null
          ? null
          : DateTime.parse(json['obsTimeUtc'] as String),
      obsTimeLocal: json['obsTimeLocal'] == null
          ? null
          : DateTime.parse(json['obsTimeLocal'] as String),
      neighborhood: json['neighborhood'] as String?,
      softwareType: json['softwareType'] as String?,
      country: json['country'] as String?,
      solarRadiation: (json['solarRadiation'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      realtimeFrequency: json['realtimeFrequency'] as int?,
      epoch: json['epoch'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
      winddir: json['winddir'] as int?,
      humidity: json['humidity'] as int?,
      qcStatus: json['qcStatus'] as int?,
      metric: (json['metric'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$_ObservationToJson(_$_Observation instance) =>
    <String, dynamic>{
      'stationID': instance.stationId,
      'obsTimeUtc': instance.obsTimeUtc?.toIso8601String(),
      'obsTimeLocal': instance.obsTimeLocal?.toIso8601String(),
      'neighborhood': instance.neighborhood,
      'softwareType': instance.softwareType,
      'country': instance.country,
      'solarRadiation': instance.solarRadiation,
      'lon': instance.lon,
      'realtimeFrequency': instance.realtimeFrequency,
      'epoch': instance.epoch,
      'lat': instance.lat,
      'uv': instance.uv,
      'winddir': instance.winddir,
      'humidity': instance.humidity,
      'qcStatus': instance.qcStatus,
      'metric': instance.metric,
    };
