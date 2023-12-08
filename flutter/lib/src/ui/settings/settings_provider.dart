import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/models/units.dart';

import 'settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsProvider with ChangeNotifier {
  SettingsProvider(this.ref);
  final Ref ref;

  // Fetch SettingsService with dependency injection so it can be easily mocked
  SettingsService get _settingsService => ref.read(settingsServiceProvider);

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;


  late Units _units;
  Units get units => _units;

  late String _wundergroundApiKey;
  String get wundergroundApiKey => _wundergroundApiKey;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _units = await _settingsService.units();
    _wundergroundApiKey = await _settingsService.wundergroundApiKey();
    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new theme mode in memory
    _themeMode = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateUnits(Units? units) async {
    if (units==null) return;
    _units = units;
    notifyListeners();
    await _settingsService.setUnits(units);
  }

  Future<void> updateWundergroundApiKey(String? key) async{
    if (key==null) return;
    if (key==_wundergroundApiKey) return;
    _wundergroundApiKey = key;
    notifyListeners();
    await _settingsService.setWundergroundApiKey(key);
  }

}