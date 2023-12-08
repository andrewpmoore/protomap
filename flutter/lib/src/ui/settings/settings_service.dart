import 'package:flutter/material.dart';
import 'package:gusty/src/models/units.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString('theme') ?? 'system';
    if (themeString=='system'){
      return ThemeMode.system;
    }
    else if (themeString=='light'){
      return ThemeMode.light;
    }
    else {
      return ThemeMode.dark;
    }
  }


  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {

    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    final prefs = await SharedPreferences.getInstance();

    String themeMode = 'system';
    switch (theme){
      case ThemeMode.system:
        themeMode = 'system';
        break;
      case ThemeMode.light:
        themeMode = 'light';
        break;
      case ThemeMode.dark:
        themeMode = 'dark';
        break;
    }

    await prefs.setString('theme', themeMode);
  }



  Future<Units> units() async {
    final prefs = await SharedPreferences.getInstance();
    String temperature = prefs.getString('units_temperature') ?? 'c';
    String speed = prefs.getString('units_speed') ?? 'mph';
    String rain = prefs.getString('units_rain') ?? 'mm';
    String pressure = prefs.getString('units_pressure') ?? 'mbar';
    String time = prefs.getString('units_time') ?? '24h';
    String distance = prefs.getString('units_distance') ?? 'km';
    String airQuality = prefs.getString('units_air_quality') ?? 'us';
    String airQualitySensitivity = prefs.getString('units_air_quality_sensitivity') ?? 'normal';
    return Units(temperature: temperature, speed: speed, rain: rain, pressure: pressure, distance: distance, airQuality: airQuality, airQualitySensitivity: airQualitySensitivity, time: time);
  }


  Future<void> setUnits(Units units) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('units_temperature', units.temperature);
    prefs.setString('units_speed', units.speed);
    prefs.setString('units_rain', units.rain);
    prefs.setString('units_pressure', units.pressure);
    prefs.setString('units_time', units.time);
    prefs.setString('units_distance', units.distance);
    prefs.setString('units_air_quality', units.airQuality);
    prefs.setString('units_air_quality_sensitivity', units.airQualitySensitivity);
  }


  Future<String> wundergroundApiKey() async{
    final prefs = await SharedPreferences.getInstance();
    String key = prefs.getString('wunderground_api_key') ?? '';
    return key;
  }

  Future<void> setWundergroundApiKey(String key) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('wunderground_api_key', key);
  }

}
