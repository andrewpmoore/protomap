import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/models/weather_area.dart';
import 'package:gusty/src/shared_providers/weather_areas_provider.dart';
import 'package:gusty/src/ui/weather_details.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // List<WeatherArea> weatherAreas = ref.watch(weatherProvider.weatherAreas);
        return Text('dashboard');
        // WeatherAreasProvider weatherProv = ref.watch(weatherProvider);
        // if (weatherProv.weatherAreaFavourites.isEmpty){
        //   return Container();
        // }
        // //,weatherProv.weatherAreaFavourites.first, weatherProv.weatherAreaFavourites.first.name!, weatherProv.weatherAreaFavourites.first.region!, weatherProv.weatherAreaFavourites.first.country!,
        // return WeatherDetailsView(includeAppBar: false, stationId: weatherProv.weatherAreaFavourites.first.stationId!, provider: weatherProv.weatherAreaFavourites.first.provider!, lat: weatherProv.weatherAreaFavourites.first.location!.lat!.toString() ,lon: weatherProv.weatherAreaFavourites.first.location!.lon!.toString(),
        // region: weatherProv.weatherAreaFavourites.first.region!, name: weatherProv.weatherAreaFavourites.first.name!, country: weatherProv.weatherAreaFavourites.first.country!,);
      },
    );

  }
}
