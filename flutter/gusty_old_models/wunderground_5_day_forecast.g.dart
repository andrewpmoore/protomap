// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wunderground_5_day_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wunderground5DayForecast _$$_Wunderground5DayForecastFromJson(
        Map<String, dynamic> json) =>
    _$_Wunderground5DayForecast(
      calendarDayTemperatureMax:
          (json['calendarDayTemperatureMax'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toDouble())
              .toList(),
      calendarDayTemperatureMin:
          (json['calendarDayTemperatureMin'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toDouble())
              .toList(),
      dayOfWeek: (json['dayOfWeek'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      expirationTimeUtc: (json['expirationTimeUtc'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      moonPhase: (json['moonPhase'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonPhaseCode: (json['moonPhaseCode'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonPhaseDay: (json['moonPhaseDay'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      moonriseTimeLocal: (json['moonriseTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonriseTimeUtc: (json['moonriseTimeUtc'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      moonsetTimeLocal: (json['moonsetTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      moonsetTimeUtc: (json['moonsetTimeUtc'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      narrative: (json['narrative'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      qpf: (json['qpf'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qpfSnow: (json['qpfSnow'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      sunriseTimeLocal: (json['sunriseTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      sunriseTimeUtc: (json['sunriseTimeUtc'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      sunsetTimeLocal: (json['sunsetTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      sunsetTimeUtc: (json['sunsetTimeUtc'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      temperatureMax: (json['temperatureMax'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      temperatureMin: (json['temperatureMin'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      validTimeLocal: (json['validTimeLocal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      validTimeUtc: (json['validTimeUtc'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      daypart: (json['daypart'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Daypart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_Wunderground5DayForecastToJson(
        _$_Wunderground5DayForecast instance) =>
    <String, dynamic>{
      'calendarDayTemperatureMax': instance.calendarDayTemperatureMax,
      'calendarDayTemperatureMin': instance.calendarDayTemperatureMin,
      'dayOfWeek': instance.dayOfWeek,
      'expirationTimeUtc': instance.expirationTimeUtc,
      'moonPhase': instance.moonPhase,
      'moonPhaseCode': instance.moonPhaseCode,
      'moonPhaseDay': instance.moonPhaseDay,
      'moonriseTimeLocal': instance.moonriseTimeLocal,
      'moonriseTimeUtc': instance.moonriseTimeUtc,
      'moonsetTimeLocal': instance.moonsetTimeLocal,
      'moonsetTimeUtc': instance.moonsetTimeUtc,
      'narrative': instance.narrative,
      'qpf': instance.qpf,
      'qpfSnow': instance.qpfSnow,
      'sunriseTimeLocal': instance.sunriseTimeLocal,
      'sunriseTimeUtc': instance.sunriseTimeUtc,
      'sunsetTimeLocal': instance.sunsetTimeLocal,
      'sunsetTimeUtc': instance.sunsetTimeUtc,
      'temperatureMax': instance.temperatureMax,
      'temperatureMin': instance.temperatureMin,
      'validTimeLocal': instance.validTimeLocal,
      'validTimeUtc': instance.validTimeUtc,
      'daypart': instance.daypart,
    };

_$_Daypart _$$_DaypartFromJson(Map<String, dynamic> json) => _$_Daypart(
      cloudCover: (json['cloudCover'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      dayOrNight: (json['dayOrNight'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      daypartName: (json['daypartName'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      iconCode:
          (json['iconCode'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      iconCodeExtend: (json['iconCodeExtend'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      narrative: (json['narrative'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      precipChance: (json['precipChance'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      precipType: (json['precipType'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      qpf: (json['qpf'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qpfSnow: (json['qpfSnow'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      qualifierCode: (json['qualifierCode'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      qualifierPhrase: (json['qualifierPhrase'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      relativeHumidity: (json['relativeHumidity'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      snowRange: (json['snowRange'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      temperature: (json['temperature'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      temperatureHeatIndex: (json['temperatureHeatIndex'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      temperatureWindChill: (json['temperatureWindChill'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      thunderCategory: (json['thunderCategory'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      thunderIndex: (json['thunderIndex'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      uvDescription: (json['uvDescription'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      uvIndex: (json['uvIndex'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windDirection: (json['windDirection'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windDirectionCardinal: (json['windDirectionCardinal'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      windPhrase: (json['windPhrase'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      windSpeed: (json['windSpeed'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      wxPhraseLong: (json['wxPhraseLong'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      wxPhraseShort: (json['wxPhraseShort'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$_DaypartToJson(_$_Daypart instance) =>
    <String, dynamic>{
      'cloudCover': instance.cloudCover,
      'dayOrNight': instance.dayOrNight,
      'daypartName': instance.daypartName,
      'iconCode': instance.iconCode,
      'iconCodeExtend': instance.iconCodeExtend,
      'narrative': instance.narrative,
      'precipChance': instance.precipChance,
      'precipType': instance.precipType,
      'qpf': instance.qpf,
      'qpfSnow': instance.qpfSnow,
      'qualifierCode': instance.qualifierCode,
      'qualifierPhrase': instance.qualifierPhrase,
      'relativeHumidity': instance.relativeHumidity,
      'snowRange': instance.snowRange,
      'temperature': instance.temperature,
      'temperatureHeatIndex': instance.temperatureHeatIndex,
      'temperatureWindChill': instance.temperatureWindChill,
      'thunderCategory': instance.thunderCategory,
      'thunderIndex': instance.thunderIndex,
      'uvDescription': instance.uvDescription,
      'uvIndex': instance.uvIndex,
      'windDirection': instance.windDirection,
      'windDirectionCardinal': instance.windDirectionCardinal,
      'windPhrase': instance.windPhrase,
      'windSpeed': instance.windSpeed,
      'wxPhraseLong': instance.wxPhraseLong,
      'wxPhraseShort': instance.wxPhraseShort,
    };
