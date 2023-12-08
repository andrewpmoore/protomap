// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seven_timer_civil_light_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SevenTimerCivilLightForecast _$$_SevenTimerCivilLightForecastFromJson(
        Map<String, dynamic> json) =>
    _$_SevenTimerCivilLightForecast(
      product: json['product'] as String,
      init: json['init'] as String,
      dataseries: (json['dataseries'] as List<dynamic>)
          .map((e) => Datasery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SevenTimerCivilLightForecastToJson(
        _$_SevenTimerCivilLightForecast instance) =>
    <String, dynamic>{
      'product': instance.product,
      'init': instance.init,
      'dataseries': instance.dataseries,
    };

_$_Datasery _$$_DataseryFromJson(Map<String, dynamic> json) => _$_Datasery(
      date: json['date'] as int,
      weather: json['weather'] as String,
      temp2M: json['temp2m'] == null
          ? null
          : Temp2M.fromJson(json['temp2m'] as Map<String, dynamic>),
      wind10MMax: (json['wind10m_max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_DataseryToJson(_$_Datasery instance) =>
    <String, dynamic>{
      'date': instance.date,
      'weather': instance.weather,
      'temp2m': instance.temp2M,
      'wind10m_max': instance.wind10MMax,
    };

_$_Temp2M _$$_Temp2MFromJson(Map<String, dynamic> json) => _$_Temp2M(
      max: (json['max'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_Temp2MToJson(_$_Temp2M instance) => <String, dynamic>{
      'max': instance.max,
      'min': instance.min,
    };
