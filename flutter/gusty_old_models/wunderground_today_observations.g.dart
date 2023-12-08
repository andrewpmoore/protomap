// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wunderground_today_observations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WundergroundTodayObservations _$$_WundergroundTodayObservationsFromJson(
        Map<String, dynamic> json) =>
    _$_WundergroundTodayObservations(
      observations: (json['observations'] as List<dynamic>)
          .map((e) => Observation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WundergroundTodayObservationsToJson(
        _$_WundergroundTodayObservations instance) =>
    <String, dynamic>{
      'observations': instance.observations,
    };

_$_Observation _$$_ObservationFromJson(Map<String, dynamic> json) =>
    _$_Observation(
      stationId: json['stationID'] as String,
      tz: json['tz'] as String,
      obsTimeUtc: DateTime.parse(json['obsTimeUtc'] as String),
      obsTimeLocal: DateTime.parse(json['obsTimeLocal'] as String),
      epoch: json['epoch'] as int,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      solarRadiationHigh: (json['solarRadiationHigh'] as num?)?.toDouble(),
      uvHigh: (json['uvHigh'] as num?)?.toDouble(),
      winddirAvg: (json['winddirAvg'] as num?)?.toDouble(),
      humidityHigh: (json['humidityHigh'] as num?)?.toDouble(),
      humidityLow: (json['humidityLow'] as num?)?.toDouble(),
      humidityAvg: (json['humidityAvg'] as num?)?.toDouble(),
      qcStatus: (json['qcStatus'] as num?)?.toDouble(),
      metric: (json['metric'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num?)?.toDouble()),
      ),
    );

Map<String, dynamic> _$$_ObservationToJson(_$_Observation instance) =>
    <String, dynamic>{
      'stationID': instance.stationId,
      'tz': instance.tz,
      'obsTimeUtc': instance.obsTimeUtc.toIso8601String(),
      'obsTimeLocal': instance.obsTimeLocal.toIso8601String(),
      'epoch': instance.epoch,
      'lat': instance.lat,
      'lon': instance.lon,
      'solarRadiationHigh': instance.solarRadiationHigh,
      'uvHigh': instance.uvHigh,
      'winddirAvg': instance.winddirAvg,
      'humidityHigh': instance.humidityHigh,
      'humidityLow': instance.humidityLow,
      'humidityAvg': instance.humidityAvg,
      'qcStatus': instance.qcStatus,
      'metric': instance.metric,
    };
