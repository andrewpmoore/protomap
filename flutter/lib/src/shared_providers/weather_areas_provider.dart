// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/common/common.dart';
import 'package:gusty/src/models/saved_weather_areas.dart';
import 'package:gusty/src/models/weather_area.dart';
import 'package:gusty/src/models/wunderground_today_observations.dart';
import 'package:gusty/src/ui/settings/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/weather_repository.dart';


// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
class WeatherAreasProvider extends ChangeNotifier {
  // We initialize the list of todos to an empty list
  WeatherAreasProvider(this.ref) : super() {
    getAllSavedWeatherAreas();
  }
  final Ref ref;


  SettingsService get _settingsService => ref.read(settingsServiceProvider);

  final IWeatherRepository _weatherRepository = WeatherRepository();

  List<WeatherArea> _weatherAreaFavourites = [];


  // WundergroundTodayObservations? _todayObservations;
  //
  //
  // WundergroundTodayObservations? get todayObservations => _todayObservations;
  //
  // set todayObservations(WundergroundTodayObservations? value) {
  //   _todayObservations = value;
  //   notifyListeners();
  // }

  List<WeatherArea> get weatherAreaFavourites => _weatherAreaFavourites;

  set weatherAreaFavourites(List<WeatherArea> value) {
    _weatherAreaFavourites = value;
    notifyListeners();
  }

  Future<void> getAllSavedWeatherAreas() async {
    final prefs = await SharedPreferences.getInstance();
    String savedWeatherAreaString = prefs.getString(prefsWeatherAreas) ?? '';
    if (savedWeatherAreaString.isNotEmpty) {
      final List<SavedWeatherAreas> savedWeatherAreas = savedWeatherAreasFromJson(savedWeatherAreaString);
      for (SavedWeatherAreas savedWeatherArea in savedWeatherAreas) {
        WeatherArea area = await _weatherRepository.getWeather('${savedWeatherArea.lat}','${savedWeatherArea.lon}', provider: savedWeatherArea.provider, wundergroundApiKey: await ref.read(settingsServiceProvider).wundergroundApiKey(), stationId: savedWeatherArea.stationId);
        // area = area.copyWith(type: savedWeatherArea.type);
        area.location!.name = savedWeatherArea.name;
        area.region = savedWeatherArea.region;
        area.name = savedWeatherArea.name;
        area.country = savedWeatherArea.country;
        area.provider = savedWeatherArea.provider;
        area.stationId = savedWeatherArea.stationId;
        //Location location = area.location.copyWith(name: savedWeatherArea.name,);
        //WeatherArea updatedNameArea = area.copyWith(location: location, name: savedWeatherArea.name, region: savedWeatherArea.region, country: savedWeatherArea.country, provider: savedWeatherArea.provider, stationId: savedWeatherArea.stationId);
        addWeatherArea(area);
        getWeatherAreaExtendedForecast(lat: savedWeatherArea.lat.toString(), lon: savedWeatherArea.lon.toString());
      }
    }
  }




  // Let's allow the UI to add todos.
  void addWeatherArea(WeatherArea area) {
    // Since our state is immutable, we are not allowed to do `state.add(area)`.
    // Instead, we should create a new list of WeatherAreas which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    // weatherAreaFavourites = [...weatherAreaFavourites, area];

    bool found = false;
    for (WeatherArea wa in weatherAreaFavourites){
      if (wa.location!.lat==area.location!.lat && wa.location!.lon==area.location!.lon){
        wa = area;
        found = true;
      }
    }
    if (!found) {
      weatherAreaFavourites.add(area);
    }
    notifyListeners();
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }

  // Let's allow removing todos
  void removeWeatherArea(String weatherAreaId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    weatherAreaFavourites = [
       for (final weatherArea in weatherAreaFavourites)
       if ('${weatherArea.location!.lat},${weatherArea.location!.lon}' != weatherAreaId) weatherArea,
     ];
  }


  void addFavourite({required WeatherArea weatherArea, required String name, required String region, required String country, required String provider, required String stationId}) async {
    final prefs = await SharedPreferences.getInstance();
    String savedWeatherAreaString = prefs.getString(prefsWeatherAreas) ?? '';
    List<SavedWeatherAreas> savedWeatherAreas = [];
    if (savedWeatherAreaString.isNotEmpty) {
      savedWeatherAreas = savedWeatherAreasFromJson(savedWeatherAreaString);
      print('saved stuff ${savedWeatherAreaString}');
    }
    print('save weather with $name, $region, $country');
    print('save weather station ${weatherArea.stationId}');
    print('save weather provider ${provider}');
    // print('save weathertype ${weatherArea.type}');
    savedWeatherAreas.add(SavedWeatherAreas(id: '${weatherArea.location!.lat},${weatherArea.location!.lon}',
        lat: weatherArea.location!.lat!,
        name: name.trim(),
        region: region.trim(),
        country: country.trim(),
        lon: weatherArea.location!.lon!,
        // type: weatherArea.type!,
        provider: provider,
        stationId: stationId,
        isFavourite: true,
        isHome: false,
        order: DateTime.now().millisecondsSinceEpoch));

    prefs.setString(prefsWeatherAreas, savedWeatherAreasToJson(savedWeatherAreas));
    weatherArea.name = name.trim();
    weatherArea.region = region.trim();
    weatherArea.country = country.trim();
    weatherArea.provider = provider;
    weatherArea.stationId = stationId;
    addWeatherArea(weatherArea);
    // addWeatherArea(weatherArea.copyWith(name: name.trim(), region: region.trim(), country: country.trim(), provider: provider, stationId: stationId));
    _isFavourite = true;
    notifyListeners();
  }

  Future<void> updateAreaOrder(List<WeatherArea> listOfAreas) async{
    final prefs = await SharedPreferences.getInstance();
    List<SavedWeatherAreas> savedWeatherAreas = [];
    for (int i =0; i<listOfAreas.length; i++){
      savedWeatherAreas.add(SavedWeatherAreas(id: '${listOfAreas[i].location!.lat},${listOfAreas[i].location!.lon}',
          lat: listOfAreas[i].location!.lat!,
          name: listOfAreas[i].location!.name!.trim(),
          lon: listOfAreas[i].location!.lon!,
          // type: listOfAreas[i].type!,
          region: listOfAreas[i].location!.region!.trim(),
          country: listOfAreas[i].location!.country!.trim(),
          provider: listOfAreas[i].provider??'default',
          stationId: listOfAreas[i].stationId!,
          isFavourite: true,
          isHome: false,
          order: i));
      // print('order: $i area ${listOfAreas[i].location.name}');
    }
    prefs.setString(prefsWeatherAreas, savedWeatherAreasToJson(savedWeatherAreas));
    weatherAreaFavourites = listOfAreas;
  }


  Future<void> removeFavourite(String lat, String lon) async{
    final prefs = await SharedPreferences.getInstance();
    String savedWeatherAreaString = prefs.getString(prefsWeatherAreas) ?? '';
    List<SavedWeatherAreas> savedWeatherAreas = [];
    if (savedWeatherAreaString.isNotEmpty) {
      savedWeatherAreas = savedWeatherAreasFromJson(savedWeatherAreaString);
    }
    savedWeatherAreas.removeWhere((area) {
      if (area.id=='$lat,$lon'){
        return true;
      }
      else{
        return false;
      }
    });
    prefs.setString(prefsWeatherAreas, savedWeatherAreasToJson(savedWeatherAreas));
    removeWeatherArea('$lat,$lon');
    _isFavourite = false;
    notifyListeners();
  }



  Future<bool> getIsFavourite(String lat, String lon) async{
    final prefs = await SharedPreferences.getInstance();
    String savedWeatherAreaString = prefs.getString(prefsWeatherAreas) ?? '';
    List<SavedWeatherAreas> savedWeatherAreas = [];
    if (savedWeatherAreaString.isNotEmpty) {
      savedWeatherAreas = savedWeatherAreasFromJson(savedWeatherAreaString);
    }
    for (SavedWeatherAreas swa in savedWeatherAreas){
      if (swa.id=='$lat,$lon'){
        return swa.isFavourite;
      }
    }
    return false;
  }


  WeatherArea? _singleWeatherArea;
  bool _isFavourite = false;

  bool get isFavourite => _isFavourite;
  set isFavourite(bool value) {
    _isFavourite = value;
    notifyListeners();
  }

  WeatherArea? get singleWeatherArea => _singleWeatherArea;

  set singleWeatherArea(WeatherArea? value) {
    _singleWeatherArea = value;
    notifyListeners();
  }

  Future<void> getWeatherArea({required lat, required lon, String? provider, String? stationId}) async{
    //first check the ones we already have, if not found make an api call


    // print('*********** get weather area');
    _singleWeatherArea = null;
    _isFavourite = false;

    bool found = false;
    for (WeatherArea wa in weatherAreaFavourites){
      if (wa.location!.lat.toString()==lat.toString()&&wa.location!.lon.toString()==lon.toString()){
        // print('found');
        _singleWeatherArea = wa;
        if (wa.stationId!='xxx') {
          // print('*********** station id ${wa.stationId}');
          String wundergroundKey = await ref.read(settingsServiceProvider).wundergroundApiKey();
          _singleWeatherArea!.todayObservations = await _weatherRepository.getWundergroundTodayObservations(stationId: _singleWeatherArea!.stationId, wundergroundApiKey: wundergroundKey);

        }
        found = true;
        _isFavourite = await getIsFavourite(lat, lon);
        break;
      }
    }
    if (!found) {
      print('not found get weather using provider $provider');
      String wundergroundKey = await ref.read(settingsServiceProvider).wundergroundApiKey();
      _singleWeatherArea = await _weatherRepository.getWeather(lat, lon, provider: provider, wundergroundApiKey: wundergroundKey, stationId: stationId??'xxx');
      // print('single weather here 1 ${_singleWeatherArea?.stationId}');
      if (_singleWeatherArea?.stationId!='xxx') {
        print('has station id');
        // print('*********** station id2 ${_singleWeatherArea?.stationId}');
        _singleWeatherArea!.todayObservations = await _weatherRepository.getWundergroundTodayObservations(stationId: _singleWeatherArea!.stationId, wundergroundApiKey: wundergroundKey);
        print('observations ${_singleWeatherArea?.todayObservations ?? 'nothing'}');
      }
      // print('past today obs');
    }
    getWeatherAreaExtendedForecast(lat: lat, lon: lon);

    notifyListeners();
  }

  void refreshData() {
    print('refresh data');
    // _weatherAreaFavourites.clear();
    getAllSavedWeatherAreas();
  }

  bool doesForecastDayExist(List<Forecastday> list, DateTime dateToMatch){
    for (Forecastday day in list){
      if (DateUtils.isSameDay(day.date!, dateToMatch)){
        return true;
      }
    }
    return false;
  }

  void getWeatherAreaExtendedForecast({required String lat, required String lon}) async {
    List<Forecastday> dayList = await _weatherRepository.getWeatherExtendedForecast(lat,lon,);
    if (dayList.isNotEmpty){
      for (WeatherArea area in _weatherAreaFavourites){
        if (area.location!.lat==double.parse(lat)&&area.location!.lon==double.parse(lon)){
          for (Forecastday newDay in dayList) {
            if (!doesForecastDayExist(area.forecast!.forecastday!, newDay.date!)) {
              area.forecast!.forecastday!.add(newDay);
            }
          }
        }
      }
    }
    notifyListeners();
  }

}


