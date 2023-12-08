import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:gusty/src/common/common.dart';
import 'package:gusty/src/env/env.dart';
import 'package:gusty/src/models/search_results.dart';
import 'package:gusty/src/models/search_results_from_geocode.dart';
import 'package:gusty/src/models/seven_timer_civil_light_forecast.dart';
import 'package:gusty/src/models/wunderground_5_day_forecast.dart';
import 'package:gusty/src/models/wunderground_pws_current_observations.dart';
import 'package:gusty/src/models/wunderground_search_results.dart';
import 'package:gusty/src/models/wunderground_today_observations.dart';
import 'package:gusty/src/services/dio_connectivity_request_retry.dart';
import 'package:gusty/src/models/weather_area.dart';
import 'package:gusty/src/models/weather_area.dart' as wa;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:gusty/src/services/retry_interceptor.dart';

abstract class IWeatherRepository {
  Future<WeatherArea> getWeather(String lat, String lon, {String? provider, required String wundergroundApiKey, required String stationId});
  Future<List<Forecastday>> getWeatherExtendedForecast(String lat, String lon);
  Future<List<SearchResults>> getSearchResultsGeocode(String location, String? wundergroundApiKey);
  Future<WundergroundSearchResults?> getSearchResultsPWS(String location, String? wundergroundApiKey);
  Future<WundergroundTodayObservations?> getWundergroundTodayObservations({String? stationId, required String wundergroundApiKey});
  Future<bool> hasWundergroundData(String pwsId, String? wundergroundApiKey);
}

class WeatherRepository implements IWeatherRepository {
  WeatherRepository();

  final Dio client = Dio();
  DioCacheManager? _dioCacheManager;
  final String key = Env.weatherApiKey;
  final String baseUrl = 'http://api.weatherapi.com/v1';



  // cache options
  final Options _cacheOptions = buildCacheOptions(
    const Duration(minutes: 10),

    maxStale: const Duration(days: 3650),
  );

  void _addInterceptorsIfRequired(){
    if (client.interceptors.isEmpty) {
      if (kIsWeb || Platform.isWindows) {
        //no cache
      }
      else{
        _dioCacheManager = DioCacheManager(CacheConfig(baseUrl: baseUrl));
        client.interceptors.add(_dioCacheManager!.interceptor);
      }

      client.interceptors.add(
        RetryOnConnectionChangeInterceptor(
          requestRetry: DioConnectivityRequestRetry(
            dio: client,
            connectivity: Connectivity(),
          ),
        ),
      );

      // RetryOnConnectionChangeInterceptor? retryInterceptor = client.interceptors.firstWhere((interceptor) => interceptor is RetryOnConnectionChangeInterceptor) as RetryOnConnectionChangeInterceptor?;
      // if(retryInterceptor == null) {
      //
      // }
    }
  }


  @override
  Future<WeatherArea> getWeather(String lat, String lon, {String? provider='default', required String wundergroundApiKey, required String stationId}) async {
    _addInterceptorsIfRequired();

    switch(provider){
      case 'wunderground': return _getWeatherUndergroundWeather(lat, lon, wundergroundApiKey, stationId);
      default: return _getWeatherApiComWeather(lat, lon);
    }

  }


  @override
  Future<List<Forecastday>> getWeatherExtendedForecast(String lat, String lon) async {
    List<Forecastday> dayList = [];
    _addInterceptorsIfRequired();
    String urlExtendedForcast = 'https://www.7timer.info/bin/civillight.php?lon=$lon&lat=$lat&ac=0&unit=metric&output=json&tzshift=0';
    final resultExtended = await client.get(urlExtendedForcast, options: _cacheOptions);
    SevenTimerCivilLightForecast sevenTimerCivilLightForecast = sevenTimerCivilLightForecastFromJson(resultExtended.data);
    for (int i = 3; i < sevenTimerCivilLightForecast.dataseries.length; i++) {
      Datasery day = sevenTimerCivilLightForecast.dataseries[i];
      dayList.add(Forecastday(
          dateEpoch: DateTime.now().add(Duration(days: i)).millisecondsSinceEpoch,
          date: DateTime.now().add(Duration(days: i)),
          day: Day(mintempC: day.temp2M!.min!, maxtempC: day.temp2M!.max!, condition: Condition(code: 44, icon: getIconNumber(day.weather, '7timer').toString(), text: 'yyy'))));
    }
    return dayList;
  }

  Future<WeatherArea> _getWeatherApiComWeather(String lat, String lon) async {
    String url = '$baseUrl/forecast.json?key=$key&q=$lat,$lon&aqi=yes&alerts=yes&days=7';

    //get the weather from weatherapi.com (only 3 day forecast)
    final result = await client.get(url, options: _cacheOptions);
    //get more data from 7Timer (up to 7 days forecast)
 //todo   final resultExtended = await client.get(urlExtendedForcast, options: _cacheOptions);
    if (result.statusCode == 200) {

      //build up the data from the 2 providers, changing the weather icon data and merging other future data together
      WeatherArea wa = WeatherArea.fromJson(result.data);
      for (Forecastday fday in wa.forecast!.forecastday!) {
        fday.day!.condition!.icon = getIconNumber(fday.day!.condition!.code.toString(), 'weatherapi').toString();
        // Condition condition = fday.day!.condition.copyWith(icon: getIconNumber(fday.day!.condition!.code.toString(), 'weatherapi').toString());
        // Day day = fday.day.copyWith(condition: condition);
        // fday = fday.copyWith(day: day);
      }

      List<Forecastday> dayList = [];
      for (Forecastday day in wa.forecast!.forecastday!) {
        day.day!.condition!.icon = getIconNumber(day.day!.condition!.code.toString(), 'weatherapi').toString();
        // day.copyWith(day: day.day.copyWith(condition: day.day!.condition.copyWith(icon: getIconNumber(day.day!.condition!.code.toString(), 'weatherapi').toString())))
        dayList.add(day);
      }


      //todo if (resultExtended.statusCode==200){
      //   // print('7info ${resultExtended.data}');
      //   SevenTimerCivilLightForecast sevenTimerCivilLightForecast = sevenTimerCivilLightForecastFromJson(resultExtended.data);
      //   for (int i=3; i<sevenTimerCivilLightForecast.dataseries.length; i++){
      //       Datasery day = sevenTimerCivilLightForecast.dataseries[i];
      //       dayList.add(Forecastday(dateEpoch: DateTime.now().add(Duration(days: i)).millisecondsSinceEpoch,
      //           date: DateTime.now().add(Duration(days: i)),
      //           day: Day(mintempC: day.temp2M!.min!, maxtempC: day.temp2M!.max!, condition: Condition(code: 44, icon: getIconNumber(day.weather, '7timer').toString(), text: 'yyy'))));
      //     }
      // }

      Forecast forecast = Forecast(forecastday: dayList);

      wa.current!.condition!.icon = getIconNumber(wa.current!.condition!.code.toString(), 'weatherapi').toString();
      wa.forecast = forecast;

      // return wa.copyWith(
      //     // type: 'forecast',
      //     current: wa.current.copyWith(condition: wa.current!.condition!.copyWith(icon: getIconNumber(wa.current!.condition!.code.toString(), 'weatherapi').toString())),
      //     forecast: forecast);
      return wa;

    } else {
      throw Exception();
    }
  }

  Future<WeatherArea> _getWeatherUndergroundWeather(String lat, String lon, String wundergroundKey, String stationId) async {

    WeatherArea weatherArea = await _getWeatherApiComWeather(lat, lon);

    String urlPwsCurrent = 'https://api.weather.com/v2/pws/observations/current?stationId=$stationId&format=json&units=m&apiKey=$wundergroundKey';
    String urlForecast = 'https://api.weather.com/v3/wx/forecast/daily/5day?geocode=$lat,$lon&format=json&units=m&language=en-US&apiKey=$wundergroundKey';
    print('current url ${urlPwsCurrent}');
    // print('forecast url ${urlForecast}');
    final resultCurrent = await client.get(urlPwsCurrent, options: _cacheOptions);
    final resultForecast = await client.get(urlForecast, options: _cacheOptions);
    if ((resultCurrent.statusCode! >= 200) && (resultCurrent.statusCode! < 206) && resultForecast.statusCode== 200) {


print('request $lat  $lon url: $urlPwsCurrent');
      print('results ${resultCurrent.data}');
      WundergroundPwsCurrentObservations wundergroundPwsCurrentObservations = WundergroundPwsCurrentObservations.fromJson(resultCurrent.data);
      Wunderground5DayForecast wunderground5dayForecast = Wunderground5DayForecast.fromJson(resultForecast.data);

      // wa.Location location = const wa.Location(country: 'xxx', region: 'yyy', name: 'zzz', lat: 0.1, lon: 2, localtime: 'x', localtimeEpoch: 123, tzId: '1');

      final metricObs = wundergroundPwsCurrentObservations.observations.first.metric;

      // print('icon1 ${wunderground5dayForecast.daypart?.first?.iconCode?.first} ${wunderground5dayForecast.daypart?.first?.iconCode?.first==null}');
      // print('icon2 ${wunderground5dayForecast.daypart?.first?.iconCode?[1]}');


      int? icon1 = wunderground5dayForecast.daypart?.first?.iconCode?.first;
      int? icon2 = wunderground5dayForecast.daypart?.first?.iconCode?[1];
      int icon3 = 44;
      // print('icon to use ${iconCodeToUse}');
      String icon = getIconNumber((icon1??icon2??icon3).toString(), 'wunderground').toString();

      Current current = Current(tempC: metricObs!['temp']!,
          cloud: weatherArea.current!.cloud,
          condition: wa.Condition(text: wunderground5dayForecast.daypart?.first?.wxPhraseLong?.first ?? wunderground5dayForecast.daypart?.first?.wxPhraseLong?[1] ?? 'Unknown', code: wunderground5dayForecast.daypart?.first?.iconCode?.first ?? wunderground5dayForecast.daypart?.first?.iconCode?[1] ?? 44, icon: icon),
          feelslikeC: metricObs['heatIndex']!,
          gustKph: metricObs['windGust']!,
          humidity: wundergroundPwsCurrentObservations.observations.first.humidity!.toDouble(),
          isDay: weatherArea.current!.isDay,
          precipMm: metricObs['precipTotal']!,
          pressureMb: metricObs['pressure']!,
          uv: wundergroundPwsCurrentObservations.observations.first.uv!=null ? wundergroundPwsCurrentObservations.observations.first.uv!.toDouble() : -100,
          solarRadiation: wundergroundPwsCurrentObservations.observations.first.solarRadiation,
          narrative: wunderground5dayForecast.daypart?.first?.narrative?.first??wunderground5dayForecast.daypart?.first?.narrative?[1],
          visKm: weatherArea.current!.visKm,
          windDegree: wundergroundPwsCurrentObservations.observations.first.winddir??-1,
          windKph: metricObs['windSpeed']!,
          airQuality: weatherArea.current!.airQuality,
          );

      List<wa.Forecastday> dayList = [];
      for (int i=0; i<wunderground5dayForecast.calendarDayTemperatureMin!.length; i++){
        String icon = getIconNumber(wunderground5dayForecast.daypart?.first?.iconCode![i*2].toString() ?? '44', 'wunderground').toString();
        // print('forcastday length: ${weatherArea.forecast?.forecastday!.length} i $i');
        if (i>=weatherArea.forecast!.forecastday!.length){ break;}
        wa.Forecastday day = wa.Forecastday(
             date: DateTime.now().add(Duration(days: i)),
             // astro: wa.Astro(sunrise: wunderground5dayForecast.sunriseTimeLocal![i]!, sunset: wunderground5dayForecast.sunsetTimeLocal![i]!, moonrise: wunderground5dayForecast.moonriseTimeLocal![i]!, moonset: wunderground5dayForecast.moonsetTimeLocal![i]!, moonPhase: wunderground5dayForecast.moonPhase![i]!,moonIllumination: '0'),
             dateEpoch: wunderground5dayForecast.validTimeUtc![i]!.toInt(),
             day: wa.Day(mintempC: wunderground5dayForecast.temperatureMin![i]!, maxtempC: wunderground5dayForecast.temperatureMax?[i]??wunderground5dayForecast.temperatureMax![i+1]!, condition: wa.Condition(text: 'xxx', icon: icon, code: -1), dailyChanceOfRain: weatherArea.forecast?.forecastday?[i].day?.dailyChanceOfRain??0, dailyChanceOfSnow: weatherArea.forecast?.forecastday?[i].day?.dailyChanceOfSnow??0, ),
             hour: i<=1 ? weatherArea.forecast!.forecastday![i].hour : null,
             astro: i<=1 ? weatherArea.forecast!.forecastday![i].astro : null,
         );
        dayList.add(day);
      }
      for (int i=6; i<weatherArea.forecast!.forecastday!.length; i++){
        dayList.add(weatherArea.forecast!.forecastday![i]);
      }

      wa.Forecast forecast = wa.Forecast(forecastday: dayList);


      weatherArea.current = current;
      weatherArea.forecast = forecast;
      return weatherArea;

      // return weatherArea.copyWith(current: current, forecast: forecast);
    } else {
      print('result1: ${resultCurrent.statusCode}/${resultCurrent.statusMessage}');
      // print('result2: ${resultForecast.statusCode}/${resultForecast.statusMessage}');
      throw Exception();

    }
  }

  Future<WundergroundSearchResults?> getSearchResultsPWS(String location, String? wundergroundApiKey) async {
    String wundergroundUrl = 'https://api.weather.com/v3/location/search?query=$location&locationType=pws&language=en-US&format=json&apiKey=$wundergroundApiKey';
    Response? wundergroundResult;
    if (wundergroundApiKey != null && wundergroundApiKey.isNotEmpty) {
      print('key: ${wundergroundApiKey} / url: ${wundergroundUrl}');
      try {
        wundergroundResult = await client.get(wundergroundUrl, options: _cacheOptions);
      } catch (e) {
        // print(e);
      }
      if (wundergroundResult != null) {
        if (wundergroundResult.statusCode == 200) {
          return WundergroundSearchResults.fromJson(wundergroundResult.data);
        }
      }
    }
    return null;
  }


    @override
  Future<List<SearchResults>> getSearchResultsGeocode(String location, String? wundergroundApiKey) async {


    List<SearchResults> searchResults = [];

    // String url = '$baseUrl/search.json?key=$key&q=$location';   --weather api's geocoder, but not great
    String url = 'https://geocode.maps.co/search?q=$location';
    // String wundergroundUrl = 'https://api.weather.com/v3/location/search?query=$location&locationType=pws&language=en-US&format=json&apiKey=$wundergroundApiKey';


    _addInterceptorsIfRequired();

    if (location.length<3){
      return [];
    }

    final result = await client.get(url, options: _cacheOptions);


    if (result.statusCode == 200) {
      print('result.data ${result.data}');
      List<SearchResultsFromGeocode> results = List<SearchResultsFromGeocode>.from(result.data.map((x) => SearchResultsFromGeocode.fromJson(x)));
      for (SearchResultsFromGeocode result in results) {
        final nameSplit = result.displayName.split(',');
        String name = '';
        String region = '';
        String country = '';
        if (nameSplit.length >= 3) {
          name = nameSplit[0];
          region = nameSplit[1];
          country = nameSplit[nameSplit.length - 1].trim();
        } else if (nameSplit.length >= 2) {
          name = nameSplit[0];
          region = '';
          country = nameSplit[nameSplit.length - 1].trim();
        } else {
          name = result.displayName.trim();
          region = '';
          country = '';
        }
        searchResults.add(SearchResults(id: result.placeId.toString(), name: name, region: region, country: country, lat: double.parse(result.lat), lon: double.parse(result.lon), url: 'xxx', type: 'forecast', provider: 'weatherapi', stationId: 'xxx'));
      }

    }


    return searchResults;
  }

  @override
  Future<WundergroundTodayObservations?> getWundergroundTodayObservations({String? stationId, required String wundergroundApiKey}) async {

    WundergroundTodayObservations? observations;
    String wundergroundUrl = 'https://api.weather.com/v2/pws/observations/all/1day?stationId=$stationId&format=json&units=m&numericPrecision=decimal&apiKey=$wundergroundApiKey';
    // print('todayObsUrl $wundergroundUrl');
    _addInterceptorsIfRequired();
    final result = await client.get(wundergroundUrl, options: _cacheOptions);
    // print('result code ${result.statusCode} data ${result.data}');

    if (result.statusCode == 200) {
      if (result.data.toString().isEmpty){
        return null;
      }
      observations = WundergroundTodayObservations.fromJson(result.data);
      // print('observations ${observations.observations.length}');
    }
    return observations;

  }

  @override
  Future<bool> hasWundergroundData(String pwsId, String? wundergroundApiKey) async {
    bool hasData = false;
    String urlPwsCurrent = 'https://api.weather.com/v2/pws/observations/current?stationId=$pwsId&format=json&units=m&apiKey=$wundergroundApiKey';
    final resultCurrent = await client.get(urlPwsCurrent, options: _cacheOptions);
    if (resultCurrent.statusCode == 200 && resultCurrent.data.toString().isNotEmpty) {
      hasData = true;
    }
    return hasData;
  }

}
