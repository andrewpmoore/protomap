import 'dart:io';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/app.dart';
import 'package:gusty/src/common/common.dart';
import 'package:gusty/src/common/conversion.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/models/units.dart';
import 'package:gusty/src/models/weather_area.dart';
import 'package:gusty/src/shared_providers/weather_areas_provider.dart';
import 'package:gusty/src/ui/charts/chart_humidity_observations.dart';
import 'package:gusty/src/ui/charts/chart_precipitation_observations.dart';
import 'package:gusty/src/ui/charts/chart_solar_radiation_observations.dart';
import 'package:gusty/src/ui/charts/chart_temperature_and_dew_point_observations.dart';
import 'package:gusty/src/ui/charts/chart_uv_observations.dart';
import 'package:gusty/src/ui/charts/chart_wind_and_gust_observations.dart';
import 'package:gusty/src/ui/core/adjustable_scroll_controller.dart';
import 'package:gusty/src/ui/core/sunrise_sunset_painter.dart';
import 'package:intl/intl.dart';

class WeatherDetailsView extends StatefulWidget {
  // final WeatherArea weatherArea;
  final String lat;
  final String lon;
  final String name;
  final String region;
  final String country;
  final String provider;
  final String stationId;
  final bool includeAppBar;

  const WeatherDetailsView(
      {Key? key, required this.lat, required this.lon, required this.name, required this.region, required this.country, required this.provider, required this.stationId, required this.includeAppBar})
      : super(key: key);

  @override
  State<WeatherDetailsView> createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  bool obtainedWeather = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Text('11');

      // WeatherAreasProvider weatherProv = ref.watch(weatherProvider);
      // if (obtainedWeather == false) {
      //   weatherProv.getWeatherArea(lat: widget.lat, lon: widget.lon, provider: widget.provider, stationId: widget.stationId);
      //   // weatherProv.getWeatherAreaExtendedForecast(lat: widget.lat, lon: widget.lon,);
      //   obtainedWeather = true;
      // }

      // if (widget.includeAppBar) {
      //   return Scaffold(
      //       backgroundColor: context.colorScheme.background,
      //       appBar: AppBar(
      //         backgroundColor: Colors.transparent,
      //         actions: [
      //           weatherProv.singleWeatherArea == null
      //               ? const SizedBox()
      //               : IconButton(
      //                   onPressed: () {
      //                     HapticFeedback.lightImpact();
      //                     if (weatherProv.isFavourite) {
      //                       weatherProv.removeFavourite(widget.lat, widget.lon);
      //                     } else {
      //                       print('add to favs with provider ${widget.provider}');
      //                       weatherProv.addFavourite(
      //                           weatherArea: weatherProv.singleWeatherArea!, name: widget.name, region: widget.region, country: widget.country, provider: widget.provider, stationId: widget.stationId);
      //                     }
      //                   },
      //                   icon: Icon(weatherProv.isFavourite ? Icons.favorite_rounded : Icons.favorite_border_rounded, color: weatherProv.isFavourite? context.colorScheme.secondary : context.colorScheme.onSurface,))
      //         ],
      //       ),
      //       body: weatherProv.singleWeatherArea == null
      //           ? const Center(
      //               child: CircularProgressIndicator(),
      //             )
      //           : _WeatherAreaSingleView(
      //               weatherProv.singleWeatherArea!,
      //               widget.name,
      //               widget.region,
      //               widget.country,
      //             ));
      // }
      // else{
      //   return Scaffold(
      //     backgroundColor: context.colorScheme.background,
      //     body: weatherProv.singleWeatherArea == null
      //         ? const Center(
      //       child: CircularProgressIndicator(),
      //     )
      //         : _WeatherAreaSingleView(
      //       weatherProv.singleWeatherArea!,
      //       widget.name,
      //       widget.region,
      //       widget.country,
      //     ),
      //   );
      // }
    });
  }
}


class _WeatherAreaSingleView extends ConsumerWidget {
  final String name;
  final String region;
  final String country;
  const _WeatherAreaSingleView(this.weatherArea, this.name, this.region, this.country, {Key? key}) : super(key: key);

  final WeatherArea weatherArea;
  static const routeName = '/weather_area_single';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

// print('weatherAreaType ${weatherArea.type}');
// print('weatherAreaProvider ${weatherArea.provider} stationId ${weatherArea.stationId}');


    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          controller: Platform.isWindows ? AdjustableScrollController() : null,
          child: Stack(
            children: [
              Positioned(
                  right: 30,
                  top: 75,
                  child: Image.asset(
                    // '$imageWeatherIconPath/${weatherArea.current.condition.code}.png',
                    '$imageWeatherIconPath/${weatherArea.current!.isDay==1?'day/':'night/'}${weatherArea.current?.condition?.icon}.png',
                    width: 128, height: 90,
                    fit: BoxFit.contain,
                  )),
              Column(children: [
                const SizedBox(height: 56,),
                Row(children: [
                  const SizedBox(width: 30,),
                  Text(name, style: context.style.titleMedium,)
                ],

                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 35,),
                    Text(Conversion.temperature(weatherArea.current!.tempC!, ref.read(settingsProvider).units).round().toString(),style: context.style.displayLarge?.copyWith(color: context.colorScheme.onSurface),),
                    Transform.translate(offset: const Offset(0, -36), child: Text('°',style: context.style.headlineMedium?.copyWith(color: context.colorScheme.onSurface),)),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [if (weatherArea.forecast!.forecastday!.isNotEmpty) Row(
                        children: [
                          Image.asset('$imagePath/maxtemp.png', width: 10, height: 10,color: Colors.blue),
                          const SizedBox(width: 3,),
                          Text('${Conversion.temperature(weatherArea.forecast!.forecastday!.first.day!.maxtempC!, ref.read(settingsProvider).units).round().toString()}°',style: context.style.labelLarge,),
                        ],

                      ),
                        if (weatherArea.forecast!.forecastday!.isNotEmpty) const SizedBox(height: 5,),
                        if (weatherArea.forecast!.forecastday!.isNotEmpty) Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('$imagePath/mintemp.png',  width: 10, height: 10,color: Colors.blue),
                            const SizedBox(width: 3,),
                            Text('${Conversion.temperature(weatherArea.forecast!.forecastday!.first.day!.mintempC!, ref.read(settingsProvider).units).round().toString()}°',style: context.style.labelLarge,),
                          ],
                        ), const SizedBox(height: 15,)],)
                  ],

                ),
                Row(
                  children: [
                    const SizedBox(width: 35,),
                    Container(decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      shape: const StadiumBorder(),
                    ),child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Text(weatherArea.current?.condition?.text??'', style: context.style.bodyMedium?.copyWith(color: context.colorScheme.onTertiaryContainer)),
                    )),
                  ],
                ),
                const SizedBox(height: 40,),
                _RainPressureWindSummary(weatherArea),
                const SizedBox(height: 20,),
                if (weatherArea.current!.narrative!=null) const SizedBox(height: 10,),
                if (weatherArea.current!.narrative!=null) Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(weatherArea.current!.narrative!, style: context.style.labelLarge,),
                ),
                if (weatherArea.current!.narrative!=null) const SizedBox(height: 20,),
                _SunriseSunset(weatherArea),
                const SizedBox(height: 40,),
                _TodayByHour(weatherArea),
                const SizedBox(height: 10,),
                _FutureDays(weatherArea),
                const SizedBox(height: 20,),
                _WeatherAlerts(weatherArea),
                const SizedBox(height: 20,),
                _AirQuality(weatherArea),
                const SizedBox(height: 20,),
                _UVIndex(weatherArea),
                const SizedBox(height: 20,),
                if (weatherArea.provider=='wunderground') const ChartTemperatureAndDewPointObservations(includeDewPoint: false),
                if (weatherArea.provider=='wunderground') const SizedBox(height: 20,),
                //todo deal with areas without wind details (probably need this for all types)
                if (weatherArea.provider=='wunderground') const ChartWindAndGustObservations(includeGust: true,),
                if (weatherArea.provider=='wunderground') const SizedBox(height: 20,),
                if (weatherArea.provider=='wunderground') const ChartPrecipitationObservations(includeTotal: true,),
                if (weatherArea.provider=='wunderground') const SizedBox(height: 20,),
                if (weatherArea.provider=='wunderground') const ChartHumidityObservations(),
                if (weatherArea.provider=='wunderground') const SizedBox(height: 20,),
                if (weatherArea.provider=='wunderground' && weatherArea.todayObservations?.observations.first.uvHigh!=null) const ChartUVObservations(),
                if (weatherArea.provider=='wunderground' && weatherArea.todayObservations?.observations.first.uvHigh!=null) const SizedBox(height: 20,),
                if (weatherArea.provider=='wunderground' && weatherArea.todayObservations?.observations.first.solarRadiationHigh!=null) const ChartSolarRadiationObservations(),
                if (weatherArea.provider=='wunderground' && weatherArea.todayObservations?.observations.first.solarRadiationHigh!=null) const SizedBox(height: 20,),

              ],

              ),
            ],
          ),
        )
    );
  }
}




class _UVIndex extends StatelessWidget {
  final WeatherArea weatherArea;

  const _UVIndex(this.weatherArea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        if (weatherArea.current!.uv!.toInt()!=-100) Row(
          children: [
            const SizedBox(width: 30,),
            SizedBox(height: 24, width: 24,
              child: Stack(
                children: [
                  Transform.rotate(
                      angle: math.pi/4,
                      child: Container(height: 24, width: 24, color: getUVIndexColor(weatherArea.current!.uv!.toInt()),)),
                  Center(child: Text(getUVIndexCode(weatherArea.current!.uv!.toInt()), style: context.style.labelMedium!.copyWith(color: weatherArea.current!.uv!.toInt() < 7 ? Colors.black : Colors.white, fontWeight: FontWeight.w800))),
                ],
              ),
            ),
           const SizedBox(width: 20,),
           Text('UV Index ${weatherArea.current!.uv!} - ${getUVIndexDescription(weatherArea.current!.uv!.toInt())}', ),
            const Expanded(child: SizedBox()),
            const SizedBox(width: 30,),
          ],
        ),
        if (weatherArea.current!.uv!.toInt()!=-100) const SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(getUVIndexRecommendations(weatherArea.current!.uv!.toInt()), style: context.style.labelMedium),
        ),
        if (weatherArea.current!.solarRadiation!=null) Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
          child: Row(
            children: [
              Image.asset('$imagePath/solar_radiation.png', width: 24, height: 24, color: Colors.blue,),
              const SizedBox(width: 20,),
              Text('Solar radiation ${weatherArea.current!.solarRadiation!}'),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('  watts/m²', style: context.style.labelSmall,),
              )
            ],
          ),
        )
      ],
    );
  }

  Color getUVIndexColor(int uv){
    if (uv<=1){
      return colorLevel1;
    }
    else if (uv<=2){
      return colorLevel2;
    }
    else if (uv<=3){
      return colorLevel3;
    }
    else if (uv<=4){
      return colorLevel4;
    }
    else if (uv<=5){
      return colorLevel5;
    }
    else if (uv<=6){
      return colorLevel6;
    }
    else if (uv<=7){
      return colorLevel7;
    }
    else if (uv<=8){
      return colorLevel8;
    }
    else if (uv<=9){
      return colorLevel9;
    }
    else{
      return colorLevel10;
    }

  }

  String getUVIndexCode(int uv){
    if (uv<=2){
      return 'L';
    }
    else if (uv<=5){
      return 'M';
    }
    else if (uv<=7){
      return 'H';
    }
    else if (uv<=10){
      return 'VH';
    }
    else{
      return 'E';
    }
  }


  String getUVIndexDescription(int uv){
    if (uv<=2){
      return 'Low risk';
    }
    else if (uv<=5){
      return 'Moderate risk';
    }
    else if (uv<=7){
      return 'High risk';
    }
    else if (uv<=10){
      return 'Very high risk';
    }
    else{
      return 'Extreme risk';
    }
  }

  String getUVIndexRecommendations(int uv){
    if (uv<=2){
      return '';
    }
    else if (uv<=5){
      return 'Stay in shade near midday when the sun is strongest.';
    }
    else if (uv<=7){
      return 'Reduce time in the sun between 10 a.m. and 4 p.m.';
    }
    else if (uv<=10){
      return 'Minimize sun exposure between 10 a.m. and 4 p.m.';
    }
    else{
      return 'Try to avoid sun exposure between 10 a.m. and 4 p.m.';
    }

  }

}



class _AirQuality extends ConsumerWidget {
  final WeatherArea weatherArea;

  const _AirQuality(this.weatherArea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if (weatherArea.current!.airQuality!['gb-defra-index']==null){
      return const SizedBox();
    }
    int usIndex = weatherArea.current!.airQuality!['us-epa-index']!.toInt();

    Units units = ref.watch(settingsProvider).units;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('air quality stuff goes here ${weatherArea.current.airQuality}'),
          Row(
            children: [
              Image.asset('$imagePath/${getEmojiAirQuality(weatherArea.current!.airQuality!['gb-defra-index']!)}.png', width: 24, height: 24, color: getAirQualityColor(usIndex),),
              const SizedBox(width: 20,),
              Text('Air quality index: ${units.airQuality=='us' ? weatherArea.current!.airQuality!['us-epa-index'] : weatherArea.current!.airQuality!['gb-defra-index']}'),
            ],
          ),
          const SizedBox(height: 8,),
          Text(units.airQualitySensitivity=='normal' ? getSummaryGeneralPopulation(weatherArea.current!.airQuality!['gb-defra-index']!) : getSummaryAtRiskPopulation(weatherArea.current!.airQuality!['gb-defra-index']!), style: context.style.labelMedium),
          // Text('At risk population: ${getSummaryAtRiskPopulation(weatherArea.current.airQuality['gb-defra-index']!)}'),
          const SizedBox(height: 18,),

          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              if ((weatherArea.current!.airQuality!['co']??0)>0)  _AirQualityElement(weatherArea.current!.airQuality!['co']!.toStringAsFixed(0), 'Carbon Monoxide', getCarbonMonoxideLevel(weatherArea.current!.airQuality!['co']!)),
              if ((weatherArea.current!.airQuality!['o3']??0)>0)  _AirQualityElement(weatherArea.current!.airQuality!['o3']!.toStringAsFixed(0), 'Ozone', getOzoneLevel(weatherArea.current!.airQuality!['o3']!)),
              if ((weatherArea.current!.airQuality!['no2']??0)>0)  _AirQualityElement(weatherArea.current!.airQuality!['no2']!.toStringAsFixed(2), 'Nitrogen dioxide', getNitrogenLevel(weatherArea.current!.airQuality!['no2']!)),
              if ((weatherArea.current!.airQuality!['so2']??0)>0)  _AirQualityElement(weatherArea.current!.airQuality!['so2']!.toStringAsFixed(2), 'Sulphur dioxide', getSulphurLevel(weatherArea.current!.airQuality!['so2']!)),
              if ((weatherArea.current!.airQuality!['pm2_5']??0)>0)  _AirQualityElement(weatherArea.current!.airQuality!['pm2_5']!.toStringAsFixed(2), 'PM2.5', getPm2Point5Level(weatherArea.current!.airQuality!['pm2_5']!)),
              if ((weatherArea.current!.airQuality!['pm10']??0)>0)  _AirQualityElement(weatherArea.current!.airQuality!['pm10']!.toStringAsFixed(2), 'PM10', getPm10Level(weatherArea.current!.airQuality!['pm10']!)),
            ],

          ),


          const SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Good'),
              Expanded(child: SizedBox()),
              Text('Hazardous'),
            ],),
          const SizedBox(height: 8,),
          Stack(
            alignment: Alignment.center,
            children: [
              Row(children: [
                Expanded(child: Container(decoration: const BoxDecoration(color: colorLevel1, borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))), height: 8,)),
                Expanded(child: Container(color: colorLevel4, height: 8,)),
                Expanded(child: Container(color: colorLevel6, height: 8,)),
                Expanded(child: Container(color: colorLevel8, height: 8,)),
                Expanded(child: Container(color: colorLevel9, height: 8,)),
                Expanded(child: Container(decoration: const BoxDecoration(color: colorLevel10, borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))) , height: 8,)),
              ],),
              Row(children: [
                Expanded(child: Container(color: Colors.transparent, height: 16,child: Row(children: [const Expanded(child: SizedBox()), usIndex==1?Container(decoration: getMarkerDecoration(context), height: 16, width: 6,):const SizedBox(), const Expanded(child: SizedBox())]))),
                Expanded(child: Container(color: Colors.transparent, height: 16,child: Row(children: [const Expanded(child: SizedBox()), usIndex==2?Container(decoration: getMarkerDecoration(context), height: 16, width: 6,):const SizedBox(), const Expanded(child: SizedBox())]))),
                Expanded(child: Container(color: Colors.transparent, height: 16, child: Row(children: [const Expanded(child: SizedBox()), usIndex==3?Container(decoration: getMarkerDecoration(context), height: 16, width: 6,):const SizedBox(), const Expanded(child: SizedBox())]),)),
                Expanded(child: Container(color: Colors.transparent, height: 16,child: Row(children: [const Expanded(child: SizedBox()), usIndex==4?Container(decoration: getMarkerDecoration(context), height: 16, width: 6,):const SizedBox(), const Expanded(child: SizedBox())]))),
                Expanded(child: Container(color: Colors.transparent, height: 16,child: Row(children: [const Expanded(child: SizedBox()), usIndex==5?Container(decoration: getMarkerDecoration(context), height: 16, width: 6,):const SizedBox(), const Expanded(child: SizedBox())]))),
                Expanded(child: Container(color: Colors.transparent, height: 16,child: Row(children: [const Expanded(child: SizedBox()), usIndex==6?Container(decoration: getMarkerDecoration(context), height: 16, width: 6,):const SizedBox(), const Expanded(child: SizedBox())]))),
              ],),
            ],
          )
        ],
      ),
    );
  }





  Color getAirQualityColor(int airQuality){
    if (airQuality<=1){
      return const Color(0xff00a77a);
    }
    else if (airQuality<=2){
      return const Color(0xffffe141);
    }
    else if (airQuality<=3){
      return const Color(0xffffa941);
    }
    else if (airQuality<=4){
      return const Color(0xffd82042);
    }
    else if (airQuality<=5){
      return const Color(0xffbf0d9e);
    }
    else{
      return const Color(0xff6618ba);
    }


  }

  BoxDecoration getMarkerDecoration(BuildContext context){
    return BoxDecoration(color: Colors.blue, borderRadius: const BorderRadius.all(Radius.circular(4)));
  }

  String getEmojiAirQuality(double airQuality){
    if (airQuality<=3){
      return 'happy';
    }
    else if (airQuality<=6){
      return 'ok';
    }
    else{
      return 'sad';
    }
  }

  String getSummaryGeneralPopulation(double airQuality) {
    if (airQuality<=3){
      return 'Enjoy your usual outdoor activities.';
    }
    else if (airQuality<=6){
      return 'Enjoy your usual outdoor activities.';
    }
    else if (airQuality<=9){
      return 'Anyone experiencing discomfort such as sore eyes, cough or sore throat should consider reducing activity, particularly outdoors.';
    }
    else{
      return 'Reduce physical exertion, particularly outdoors, especially if you experience symptoms such as cough or sore throat.';
    }
  }

  String getSummaryAtRiskPopulation(double airQuality) {
    if (airQuality<=3){
      return 'Enjoy your usual outdoor activities.';
    }
    else if (airQuality<=6){
      return 'Adults and children with lung problems, and adults with heart problems, who experience symptoms, should consider reducing strenuous physical activity, particularly outdoors.';
    }
    else if (airQuality<=9){
      return 'Adults and children with lung problems, and adults with heart problems, should reduce strenuous physical exertion, particularly outdoors, and particularly if they experience symptoms. People with asthma may find they need to use their reliever inhaler more often. Older people should also reduce physical exertion.';
    }
    else{
      return 'Adults and children with lung problems, adults with heart problems, and older people, should avoid strenuous physical activity. People with asthma may find they need to use their reliever inhaler more often.';
    }
  }

  int getCarbonMonoxideLevel(double value) {
    if (value<=200){
      return 1;
    }
    else if (value<=400){
      return 2;
    }
    else if (value<=600){
      return 3;
    }
    else if (value<=800){
      return 4;
    }
    else if (value<=1000){
      return 5;
    }
    else if (value<=1200){
      return 6;
    }
    else if (value<=1400){
      return 7;
    }
    else if (value<=1600){
      return 8;
    }
    else if (value<=1800){
      return 9;
    }
    else{
      return 10;
    }
  }

  int getOzoneLevel(double value) {
    if (value<=33){
      return 1;
    }
    else if (value<=66){
      return 2;
    }
    else if (value<=100){
      return 3;
    }
    else if (value<=120){
      return 4;
    }
    else if (value<=140){
      return 5;
    }
    else if (value<=160){
      return 6;
    }
    else if (value<=187){
      return 7;
    }
    else if (value<=213){
      return 8;
    }
    else if (value<=240){
      return 9;
    }
    else{
      return 10;
    }
  }

  int getNitrogenLevel(double value) {
    if (value<=67){
      return 1;
    }
    else if (value<=134){
      return 2;
    }
    else if (value<=200){
      return 3;
    }
    else if (value<=267){
      return 4;
    }
    else if (value<=334){
      return 5;
    }
    else if (value<=400){
      return 6;
    }
    else if (value<=467){
      return 7;
    }
    else if (value<=534){
      return 8;
    }
    else if (value<=600){
      return 9;
    }
    else{
      return 10;
    }
  }

  int getSulphurLevel(double value) {
    if (value<=88){
      return 1;
    }
    else if (value<=177){
      return 2;
    }
    else if (value<=266){
      return 3;
    }
    else if (value<=354){
      return 4;
    }
    else if (value<=443){
      return 5;
    }
    else if (value<=532){
      return 6;
    }
    else if (value<=710){
      return 7;
    }
    else if (value<=887){
      return 8;
    }
    else if (value<=1064){
      return 9;
    }
    else{
      return 10;
    }
  }

  int getPm2Point5Level(double value) {
    if (value<=11){
      return 1;
    }
    else if (value<=23){
      return 2;
    }
    else if (value<=35){
      return 3;
    }
    else if (value<=41){
      return 4;
    }
    else if (value<=47){
      return 5;
    }
    else if (value<=53){
      return 6;
    }
    else if (value<=58){
      return 7;
    }
    else if (value<=64){
      return 8;
    }
    else if (value<=70){
      return 9;
    }
    else{
      return 10;
    }
  }

  int getPm10Level(double value) {
    if (value<=16){
      return 1;
    }
    else if (value<=33){
      return 2;
    }
    else if (value<=50){
      return 3;
    }
    else if (value<=58){
      return 4;
    }
    else if (value<=66){
      return 5;
    }
    else if (value<=75){
      return 6;
    }
    else if (value<=83){
      return 7;
    }
    else if (value<=91){
      return 8;
    }
    else if (value<=100){
      return 9;
    }
    else{
      return 10;
    }
  }

}


class _AirQualityElement extends StatelessWidget {
  final String dataValue;
  final String title;
  final int level;
  const _AirQualityElement(this.dataValue, this.title, this.level, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color colorLevel = colorLevel1;
    if (level<=1){
      colorLevel = colorLevel1;
    }
    else if (level<=2){
      colorLevel = colorLevel2;
    }
    else if (level<=3){
      colorLevel = colorLevel3;
    }
    else if (level<=4){
      colorLevel = colorLevel4;
    }
    else if (level<=5){
      colorLevel = colorLevel5;
    }
    else if (level<=6){
      colorLevel = colorLevel6;
    }
    else if (level<=7){
      colorLevel = colorLevel7;
    }
    else if (level<=8){
      colorLevel = colorLevel8;
    }
    else if (level<=9){
      colorLevel = colorLevel9;
    }
    else{
      colorLevel = colorLevel10;
    }


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
          // backgroundColor: context.colorScheme.surface,
          avatar: Container(height: 8, width: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: colorLevel),),
          label: Text('$title $dataValue', style: context.style.labelMedium,),
        ),
      ],
    );

  }
}



class _RainPressureWindSummary extends ConsumerWidget {
  final WeatherArea weatherArea;
  const _RainPressureWindSummary(this.weatherArea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (weatherArea.forecast!.forecastday!.isNotEmpty) Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 10,),
                    Image.asset(
                        '$imagePath/rain_chance.png',
                        //xxx color: Theme.of(context).colorScheme.tertiary,
                        height: 16, width: 16,color: context.colorScheme.primary
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      '${weatherArea.forecast!.forecastday!.first.day!.dailyChanceOfRain}',
                      style: context.style.labelMedium,
                      maxLines: 1,
                    ),
                    Text('%',style: context.style.labelSmall,maxLines: 1,
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 10,),
                    Image.asset('$imagePath/pressure.png',height: 16, width: 16,color: context.colorScheme.primary),
                    const SizedBox(width: 5,),
                    Text('${Conversion.pressure(weatherArea.current!.pressureMb!, ref.read(settingsProvider).units).round().toString()} ${ref.read(settingsProvider).units.pressure}',style: context.style.labelMedium,maxLines: 1,),
                    const SizedBox(width: 10,),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.rotate(
                        angle: weatherArea.current!.windDegree! * math.pi/180,
                        child: Image.asset('$imagePath/wind_direction.png', width: 16, height: 16, color: context.colorScheme.primary,)),
                    const SizedBox(width: 10,),
                    Image.asset('$imagePath/wind_icon.png',height: 16, width: 16,color: context.colorScheme.primary),
                    const SizedBox(width: 5,),
                    Text('${Conversion.speed(weatherArea.current!.windKph!, ref.read(settingsProvider).units).round().toString()} ${ref.read(settingsProvider).units.speed}',style: context.style.labelMedium,maxLines: 1,),
                    const SizedBox(width: 10,),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );

  }
}



class _SunriseSunset extends ConsumerWidget {
  final WeatherArea weatherArea;
  const _SunriseSunset(this.weatherArea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (weatherArea.forecast!.forecastday!.isEmpty){
      return const SizedBox();
    }
    String sunrise = Conversion.time(DateFormat("yyyy-MM-dd h:mm a").parse('2000-01-01 ${weatherArea.forecast!.forecastday!.first.astro?.sunrise}'), ref.read(settingsProvider).units);
    String sunset = Conversion.time(DateFormat("yyyy-MM-dd h:mm a").parse('2000-01-01 ${weatherArea.forecast!.forecastday!.first.astro?.sunset}'), ref.read(settingsProvider).units);
    return CustomPaint(painter: SunriseSunsetPainter(startColor: Colors.red, endColor: Colors.green),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: SizedBox(
                  height: 130,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 10,),
                            Image.asset('$imagePath/sunrise.png',height: 28, width: 28,),
                            const SizedBox(width: 10,),
                            Text(sunrise),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 18,
                        right: 10,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(sunset),
                            const SizedBox(width: 10,),
                            Image.asset('$imagePath/sunset.png',height: 28, width: 28,),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ),

                    ],

                  ),
                ),

              ),
            ),
          ],
        )

    );

  }
}


class _TodayByHour extends ConsumerWidget {
  final WeatherArea weatherArea;
  const _TodayByHour(this.weatherArea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    DateTime localDateTime = DateFormat('yyyy-MM-dd HH:mm').parse(weatherArea.location!.localtime!);
    List<Hour?> hoursToShow = [];
    if (weatherArea.forecast!.forecastday!.isNotEmpty) {
      hoursToShow = weatherArea.forecast!.forecastday!.first.hour!.where((hour) =>DateTime.parse(hour.time!).hour >= localDateTime.hour).toList();
    }
    List<Hour?> hoursToShowNextDay = [];
    if (weatherArea.forecast!.forecastday!.isNotEmpty) {
      hoursToShowNextDay = weatherArea.forecast!.forecastday![1].hour!.take(6).toList();
    }
    List<Hour?> displayHours = [...hoursToShow, ...hoursToShowNextDay];
    return Column(
      children: [
        Row(
          children:  const [
            SizedBox(width: 30,),
            Expanded(child: Text('Today',)),//  style: context.style.labelLarge,
          ],
        ),
        const SizedBox(height: 25,),
        SizedBox(
          height: 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: displayHours.length,
              itemBuilder: ((context, index) {
                Hour hour = displayHours[index]!;
                return Padding(
                  padding: EdgeInsets.only(left: index==0? 30: 16, right: index==displayHours.length-1? 30 : 16),
                  child: Column(
                    children: [
                      Text(Conversion.time(DateTime.parse(hour.time!), ref.read(settingsProvider).units), style: context.style.labelMedium,),
                      const SizedBox(height: 10,),
                      Text('${hour.chanceOfRain==0?'':hour.chanceOfRain}${hour.chanceOfRain==0?'':'%'}', style: context.style.labelLarge),
                      Image.network('https:${hour.condition!.icon!}', width: 32, height: 32,),
                      const SizedBox(height: 10,),
                      Text('${Conversion.temperature(hour.tempC!, ref.read(settingsProvider).units).round().toString()}°', style: context.style.labelLarge,),
                      const SizedBox(height: 20,),
                      Transform.rotate(
                          angle: hour.windDegree! * math.pi/180,
                          child: Image.asset('$imagePath/wind_direction.png', width: 16, height: 16, color: context.colorScheme.primary,)),
                      const SizedBox(height: 10,),
                      Text('${Conversion.speed(hour.windKph!, ref.read(settingsProvider).units).round().toString()} ${ref.read(settingsProvider).units.speed}', style: context.style.labelSmall,),

                    ],
                  ),
                );
              })
          ),
        )

      ],
    );
  }
}


class _FutureDays extends StatelessWidget {
  final WeatherArea weatherArea;
  const _FutureDays(this.weatherArea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('days ${weatherArea.forecast.forecastday.length}');
    return Column(
      children: [
        for (Forecastday day in weatherArea.forecast!.forecastday!) _SingleDaySummary(day)
      ],
    );
  }
}


class _SingleDaySummary extends ConsumerWidget {
  final Forecastday day;
  const _SingleDaySummary(this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (day.date!.day==DateTime.now().day) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const SizedBox(width: 30,),
          Expanded(child: Text(DateFormat('EEEE').format(day.date!))),
          SizedBox(width: 50, child: Image.asset('$imageWeatherIconPath/day/${day.day!.condition!.icon!}.png', width: 32, height: 32,)),
          const SizedBox(width: 50,),
          SizedBox(width: 50, child: Text('${Conversion.temperature(day.day!.maxtempC!, ref.read(settingsProvider).units).round().toString()}°')),
          SizedBox(width: 50, child: Text('${Conversion.temperature(day.day!.mintempC!, ref.read(settingsProvider).units).round().toString()}°', style: context.style.labelLarge)),
          const SizedBox(width: 20,),

        ],
      ),
    );
  }
}



class _WeatherAlerts extends StatelessWidget {
  final WeatherArea weatherArea;
  const _WeatherAlerts(this.weatherArea, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


      //create one list to store the distinct models
      // List<Alert> distinct;
      List<Alert> dummy = weatherArea.alerts!.alert!;

      for(int i = 0; i < dummy.length; i++) {
        for (int j = 1; j < dummy.length; j++) {
          if (dummy[i].event == weatherArea.alerts!.alert![j].event) {
            dummy.removeAt(j);
          }
        }
      }
      List<Alert> alertsToShow = dummy.map((e) => e).toList();


    if (weatherArea.alerts!.alert!.isEmpty) {return const SizedBox();}
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(

        children: [
          for (Alert alert in alertsToShow) Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Image.asset('$imagePath/warning.png', width: 24, height: 24, color: getSeverityColor(alert.severity!)),
                  const SizedBox(width: 20,),
                  Text(alert.event!, style: context.style.titleMedium,),
                ],
              ),
              const SizedBox(height: 10,),
              Text(alert.note!.isNotEmpty ? 'Note ${alert.note}' : '', style: context.style.labelSmall,),
              // Text('Areas ${alert.areas}', style: context.style.labelSmall,),
              const SizedBox(height: 20,),
            ],
          )
        ],
      ),
    );
  }


}