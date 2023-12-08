import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/services/database/database.dart';

class WeatherProvider extends ChangeNotifier {


  List<WeatherLocation?> weatherLocationList = [];


  WeatherProvider(this.ref) : super() {
    _init();
  }
  final Ref ref;

  void _init() async{
    Stream<List<WeatherLocation>> stream = database.watchWeatherLocations();
    stream.forEach((List<WeatherLocation?> localWeatherLocation) {
      print('weather location changed - notify');
      weatherLocationList = localWeatherLocation;
      notifyListeners();
    });
  }

}