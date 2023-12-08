// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wunderground_search_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WundergroundSearchResults _$$_WundergroundSearchResultsFromJson(
        Map<String, dynamic> json) =>
    _$_WundergroundSearchResults(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WundergroundSearchResultsToJson(
        _$_WundergroundSearchResults instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      city: (json['city'] as List<dynamic>).map((e) => e as String).toList(),
      country:
          (json['country'] as List<dynamic>).map((e) => e as String).toList(),
      displayName: (json['displayName'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      latitude: (json['latitude'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      longitude: (json['longitude'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      pwsId: (json['pwsId'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'displayName': instance.displayName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'pwsId': instance.pwsId,
    };

_$_Locale _$$_LocaleFromJson(Map<String, dynamic> json) => _$_Locale(
      locale1: json['locale1'],
      locale2: json['locale2'] as String,
      locale3: json['locale3'],
      locale4: json['locale4'] as String,
    );

Map<String, dynamic> _$$_LocaleToJson(_$_Locale instance) => <String, dynamic>{
      'locale1': instance.locale1,
      'locale2': instance.locale2,
      'locale3': instance.locale3,
      'locale4': instance.locale4,
    };
