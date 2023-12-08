import 'dart:convert';
import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/env/env.dart';
import 'package:gusty/src/services/database/database.dart';
import 'package:gusty/src/services/weatherkit/models/current_weather_data.dart';
import 'package:gusty/src/services/weatherkit/models/data_set.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:gusty/src/services/weatherkit/weather_kit.dart';

Future<void> monitorWeatherSources() async {


  // database.addDataStoreEntry(DataStore(key: '${DateTime
  //     .now()
  //     .millisecond}', type: 'dummy',));

  //todo population will go from here at some point
  bool justPopulated = false;
  if ((await database.getWeatherLocations()).isEmpty) {
    justPopulated = true;


    await database.addWeatherLocationEntry(WeatherLocation(uid: '1',
        lat: '-1000',
        lng: '-1000',
        favourite: true,
        recent: false,
        name: 'Current location',
        updatedAt: DateTime.now(),
        todayForecastJson: null,
        todayPWSDataJson: null));

    await database.addWeatherLocationEntry(WeatherLocation(uid: '2',
        lat: '53.801277',
        lng: '-1.548567',
        favourite: true,
        recent: false,
        name: 'Leeds',
        updatedAt: DateTime.now(),
        todayForecastJson: null,
        todayPWSDataJson: null));
    await database.addWeatherLocationEntry(WeatherLocation(uid: '3',
        lat: '21.280693',
        lng: '-157.834549',
        favourite: false,
        recent: true,
        name: 'Waikiki',
        updatedAt: DateTime.now(),
        todayForecastJson: null,
        todayPWSDataJson: null));
  }




  List<WeatherLocation> weatherLocationList = await database.getWeatherLocations();
  // bool isFirst = true;
  for (WeatherLocation singleLocation in weatherLocationList){

    double lat = 0;
    double lng = 0;

    final weatherKit = WeatherKit();
    final token = weatherKit.generateJWT(
      bundleId: Env.weatherKitServiceId,
      teamId: Env.weatherKitTeamId,
      keyId: Env.weatherKitKeyId,
      pem: Env.weatherKitApiKey,
      expiresIn: const Duration(hours: 1),
    );

    WeatherKitModel? currentWeather;
    if (justPopulated || singleLocation.updatedAt!.isBefore(DateTime.now().subtract(const Duration(minutes: 15)))) {
      print('get weatherkit data');

      List<Placemark> placeMarks = [];

      if (double.parse(singleLocation.lat)==-1000){

        LocationPermission permission;
        bool serviceEnabled;
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          // Location services are not enabled don't continue
          // accessing the position and request users of the
          // App to enable the location services.
          return Future.error('Location services are disabled.');
        }
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.
            return Future.error('Location permissions are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }

        Position position = await Geolocator.getCurrentPosition();

        lat = position.latitude;
        lng = position.longitude;
      }
      else{
        lat = double.parse(singleLocation.lat);
        lng = double.parse(singleLocation.lng);
      }


      if (Platform.isAndroid||Platform.isIOS) {
        List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);
        print('country code: ${placeMarks.first.isoCountryCode}');
      }

      currentWeather = await weatherKit.obtainWeatherData(
        jwt: token,
        language: 'en',
        latitude: lat,
        longitude: lng,
        dataSets: '${DataSet.currentWeather.name},${DataSet.forecastDaily.name},${DataSet.forecastHourly.name},${DataSet.forecastNextHour.name},${DataSet.weatherAlerts.name}',
        timezone: tzmap.latLngToTimezoneString(lat, lng),
        countryCode: placeMarks.isEmpty ? null : placeMarks.first.isoCountryCode,
        // currentAsOf: now.add(
        //   const Duration(days: -1),
        // ),
      );


      await database.addWeatherLocationEntry(WeatherLocation(uid: singleLocation.uid, name: singleLocation.name, recent: singleLocation.recent, favourite: singleLocation.favourite, lng: lng.toString(), lat: lat.toString(), todayPWSDataJson: null, todayForecastJson: jsonEncode(currentWeather.toJson()), updatedAt: DateTime.now()));

      // if (isFirst) {
      //   await HomeWidget.saveWidgetData<String>('_temperature', aTemp.toString());
      //   await HomeWidget.updateWidget(name: 'AppWidgetProvider', iOSName: 'AppWidgetProvider');
      //   isFirst = false;
      // }

    }
    else{
      print('skip ${singleLocation.name} as api call too recent ${singleLocation.updatedAt!.difference(DateTime.now().subtract(const Duration(minutes: 15))).inMinutes}');
    }
  }


}
