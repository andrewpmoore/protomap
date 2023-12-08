import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/models/search_results.dart';
import 'package:gusty/src/models/units.dart';
import 'package:gusty/src/models/wunderground_search_results.dart';
import 'package:gusty/src/services/weather_repository.dart';

import 'settings/settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SearchProvider with ChangeNotifier {
  SearchProvider(this.ref);


  TextEditingController _textEditingController = TextEditingController();


  TextEditingController get textEditingController => _textEditingController;

  set textEditingController(TextEditingController value) {
    _textEditingController = value;
    notifyListeners();
  }

  final IWeatherRepository _weatherRepository = WeatherRepository();

  final Ref ref;

  bool _showSearchArea = false;

  bool get showSearchArea => _showSearchArea;

  String _currentSearchArea = '';


  String get currentSearchArea => _currentSearchArea;

  set currentSearchArea(String value) {
    _currentSearchArea = value;
    notifyListeners();
  }

  set showSearchArea(bool value) {
    _showSearchArea = value;
    notifyListeners();
  }

  List<SearchResults> _results = [];


  List<SearchResults> get results => _results;

  set results(List<SearchResults> value) {
    _results = value;
    notifyListeners();
  }

  void searchForArea(String value, String? wundergroundApiKey) async {
    _currentSearchArea = value;
    _results = await _weatherRepository.getSearchResultsGeocode(value, wundergroundApiKey);
    notifyListeners();
    WundergroundSearchResults? wundergroundSearchResults = await _weatherRepository.getSearchResultsPWS(value, wundergroundApiKey);
    if (wundergroundSearchResults != null) {
      for (int i = 0; i < wundergroundSearchResults.location.pwsId.length; i++) {
        bool hasData = await _weatherRepository.hasWundergroundData(wundergroundSearchResults.location.pwsId[i], wundergroundApiKey);

        if (hasData) {
          _results.add(SearchResults(id: wundergroundSearchResults.location.pwsId[i],
              name: '${wundergroundSearchResults.location.pwsId[i]}: ${wundergroundSearchResults.location.displayName[i]}',
              region: wundergroundSearchResults.location.city[i],
              country: wundergroundSearchResults.location.country[i],
              lat: wundergroundSearchResults.location.latitude[i],
              lon: wundergroundSearchResults.location.longitude[i],
              url: 'xxx',
              type: 'pws',
              provider: 'wunderground',
              stationId: wundergroundSearchResults.location.pwsId[i]));
          notifyListeners();
        }
      }
    }
    notifyListeners();
  }

  void resetSearch() {
    _currentSearchArea = '';
    _results = [];
    _textEditingController.text = '';
    showSearchArea = false;
  }
}