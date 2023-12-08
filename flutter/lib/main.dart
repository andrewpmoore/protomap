import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gusty/src/common/weather_update.dart';
import 'package:gusty/src/platforms/shared.dart';
import 'package:gusty/src/services/database/database.dart';
import 'package:gusty/src/shared_providers/weather_areas_provider.dart';
import 'package:gusty/src/shared_providers/weather_provider.dart';
import 'package:gusty/src/ui/search_provider.dart';
import 'package:gusty/src/ui/settings/settings_provider.dart';
import 'package:gusty/src/ui/settings/settings_service.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
// import 'package:background_fetch/background_fetch.dart';

import 'src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'src/services/weatherkit/models/current_weather_data.dart';

// final settingProvider = Provider<SettingsController>((_) => SettingsController(SettingsService()));
final settingsProvider = ChangeNotifierProvider((ref) => SettingsProvider(ref));
// final searchProvider = ChangeNotifierProvider((ref) => SearchProvider(ref));
final settingsServiceProvider = Provider((ref) => SettingsService());
// final weatherProvider = ChangeNotifierProvider((ref) => WeatherAreasProvider(ref));
final weatherProvider = ChangeNotifierProvider((ref) => WeatherProvider(ref));
final database = AppDatabase(platformOpenDatabaseConnection());


void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.


//   print('***${base64Encode(utf8.encode(originalString))}***');

  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Workmanager().registerOneOffTask("task-identifier", "simpleTask");
  await Workmanager().registerPeriodicTask(
    "repeatingTask",
    fetchBackground,
    frequency: const Duration(minutes: 15),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );


  await HomeWidget.registerBackgroundCallback(backgroundCallback);
  HomeWidget.setAppGroupId("group.com.reactle.gusty.group");



  updateWeatherWidget();

  runApp(const ProviderScope(
      child: GustyApp()));

  //BACKGROUND FETCH CODE
  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}


// Called when doing background work initiated from widget
Future<void> backgroundCallback(Uri? uri) async {
  print('update weather from widget ${uri?.host}');
  if (uri?.host == 'updateweather') {
    await updateWeatherWidget();
  }
}


const fetchBackground = "fetchBackground";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print('workmanager triggered: task $task inputData $inputData');
    switch (task) {
      case fetchBackground:
      // Code to run in background
        break;
    }
    try {
      await updateWeatherWidget();
    } catch (e) {
      print('callback error $e');
    }
    return Future.value(true);
  });
}



//BACKGROUND FETCH CODE
// [Android-only] This "Headless Task" is run when the Android app is terminated with `enableHeadless: true`
// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
// @pragma('vm:entry-point')
// void backgroundFetchHeadlessTask(HeadlessTask task) async {
//   print("[BackgroundFetch-headless] triggered");
//   String taskId = task.taskId;
//   bool isTimeout = task.timeout;
//   if (isTimeout) {
//     // This task has exceeded its allowed running-time.
//     // You must stop what you're doing and immediately .finish(taskId)
//     print("[BackgroundFetch-headless] Headless task timed-out: $taskId");
//     BackgroundFetch.finish(taskId);
//     return;
//   }
//   print('[BackgroundFetch-headless] Headless event received.');
//   // Do your work here...
//   await updateWeatherWidget();
//   BackgroundFetch.finish(taskId);
//   print('[BackgroundFetch-headless] finished.');
// }
// void onBackgroundFetch(String taskId) async {
//   print("[BackgroundFetch] Event received $taskId");
//   await updateWeatherWidget();
//   // IMPORTANT:  You must signal completion of your task or the OS can punish your app
//   // for taking too long in the background.
//   BackgroundFetch.finish(taskId);
// }
//
//
// /// This event fires shortly before your task is about to timeout.  You must finish any outstanding work and call BackgroundFetch.finish(taskId).
// void onBackgroundFetchTimeout(String taskId) {
//   // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
//   print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
//   BackgroundFetch.finish(taskId);
// }



Future<void> updateWeatherWidget() async {
  print('updateWeatherWidget1');
  // await monitorWeatherSources();
  // print('updateWeatherWidget2');
  //
  // List<WeatherLocation> weatherLocations = await database.getWeatherLocations();
  // WeatherKitModel weather = WeatherKitModel.fromJson(jsonDecode(weatherLocations.first.todayForecastJson??''));
  print('updateWeatherWidget3');
  // await HomeWidget.saveWidgetData<String>('_temperature', '${weatherLocations.first.name} ${weather.currentWeather?.temperature} °C @${DateFormat('HH:mm').format(DateTime.now())}');


  await HomeWidget.saveWidgetData<String>('_temperature', 'xxx 8 °C @${DateFormat('HH:mm:ss').format(DateTime.now())}');


  print('updateWeatherWidget4');
  await HomeWidget.updateWidget(name: 'AppWidgetProvider', iOSName: 'HomeWidget');
  print('updateWeatherWidget5');
}