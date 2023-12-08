import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/common/common.dart';
import 'package:gusty/src/common/conversion.dart';
import 'package:gusty/src/common/debouncer.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/models/weather_area.dart';
import 'package:gusty/src/services/database/database.dart';
import 'package:gusty/src/services/weatherkit/models/current_weather_data.dart';
import 'package:intl/intl.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:timezone/timezone.dart';




class WeatherAreaList extends ConsumerStatefulWidget  {
  const WeatherAreaList({Key? key}) : super(key: key);

  static const routeName = '/weather_area_list';

  @override
  WeatherAreaListState createState() => WeatherAreaListState();
}

class WeatherAreaListState extends ConsumerState<WeatherAreaList> {

  // late Timer timer;
  // late DateTime updatedAt = DateTime.now();



  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(const Duration(minutes: 30), (Timer t) => _refreshData());
  }

  _refreshData() {
    // ref.read(weatherProvider).refreshData();
    // setState(() {
    //   updatedAt=DateTime.now();
    // });
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }

  DateTime getCurrentDateTime(String lat, String lng) {
    // Get the current position


    final location = getLocation(tzmap.latLngToTimezoneString(double.parse(lat), double.parse(lng)));
    final date = TZDateTime.now(location);
    print(date);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    // return Text('home');



    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      shrinkWrap: true,
      itemCount: ref.watch(weatherProvider).weatherLocationList.length,
      itemBuilder: (context, index) {
        WeatherLocation? weatherLocation = ref.watch(weatherProvider).weatherLocationList[index];
        WeatherKitModel? weatherKitModel;
        if (weatherLocation!.todayForecastJson!=null && weatherLocation.todayForecastJson!.isNotEmpty){
          weatherKitModel = weatherLocation.todayForecastJson!.isNotEmpty ? WeatherKitModel.fromJson(jsonDecode(weatherLocation.todayForecastJson??'')) : null;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Text('${DateFormat('HH:mm').format(weatherLocation.updatedAt!)}'),
            trailing: Text('${weatherKitModel?.currentWeather?.temperature ?? '?'} °C'),
            subtitle: Text('${DateFormat('HH:mm').format(getCurrentDateTime(weatherLocation.lat, weatherLocation.lng))} - ${tzmap.latLngToTimezoneString(double.parse(weatherLocation.lat), double.parse(weatherLocation.lng))}'),
                title: Text(
                    weatherLocation.name),
          ),
        );
      }

    );


    // WeatherAreasProvider  weatherProv = ref.watch(weatherProvider);
    //
    //
    // List<WeatherArea> weatherAreas = weatherProv.weatherAreaFavourites;
    // // List<WeatherArea> weatherAreas = ref.watch(weatherListProvider);
    // SearchProvider searchController = ref.watch(searchProvider);
    // if (!searchController.showSearchArea){
    //   hideKeyboard(context);
    // }


    // return Scaffold(
    //   backgroundColor: context.colorScheme.background,
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         const SearchArea(),
    //         Expanded(
    //           child: Stack(
    //             fit: StackFit.loose,
    //             clipBehavior: Clip.antiAliasWithSaveLayer,
    //             children: [
    //             ReorderableGridView.builder(
    //               onReorder: (int oldIndex, int newIndex) async {
    //                 HapticFeedback.lightImpact();
    //                 // print('remove at ${oldIndex} put at ${newIndex}');
    //                 final element = weatherAreas.removeAt(oldIndex);
    //                 weatherAreas.insert(newIndex, element);
    //                 // weatherAreas.forEach((element) {print('area: ${element.location.name}');});
    //                 await weatherProv.updateAreaOrder(weatherAreas);
    //                 setState(() {
    //                   //for some reason the provider isn't causing this list to redraw, so forcing a set state once the list has been reordered
    //                 });
    //               },
    //               onDragStart: (int dragIndex){
    //                 HapticFeedback.mediumImpact();
    //               },
    //               placeholderBuilder: (dragIndex, dropIndex, dragWidget) {
    //                 return Container(
    //                   decoration: BoxDecoration(border: Border.all(color: Colors.yellow),
    //                     borderRadius: const BorderRadius.all(Radius.circular(16)),
    //                   ),
    //                   child: const SizedBox(),
    //                 );
    //               },
    //               padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
    //               // clipBehavior: Clip.none,
    //               itemCount: weatherAreas.length,
    //               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400, childAspectRatio: 1, crossAxisSpacing: 16, mainAxisExtent: 100, mainAxisSpacing: 16),
    //               itemBuilder: (context, index) {
    //
    //                 WeatherArea weatherArea = weatherAreas[index];
    //                  // print('itemBuilder - this item - ${weatherAreas[index].name} / provider ${weatherAreas[index].provider}');
    //                 return Container(decoration: BoxDecoration(color: Colors.transparent,), key: ValueKey('${weatherAreas[index].location!.lat}${weatherAreas[index].location!.lon}key'), child: _SingleWeatherArea(weatherArea: weatherArea,));
    //               },
    //             ),
    //             if (searchController.showSearchArea)
    //             // BackdropFilter(
    //             //   filter: ImageFilter.blur(sigmaX: searchController.currentSearchArea.length<=1 ? 10 : 0, sigmaY: searchController.currentSearchArea.length<=1?10 : 1),
    //               ClipRect(
    //                 child: Container(
    //                   color: Colors.red, //context.colorScheme.background.withOpacity(searchController.currentSearchArea.length <= 2 ? 0.8 : 1),
    //                   // child: BackdropFilter(
    //                   //   filter: ImageFilter.blur(sigmaX: searchController.currentSearchArea.length<=1 ? 5.0: 0, sigmaY: searchController.currentSearchArea.length<=1 ? 5.0: 0),
    //                   child: ListView.builder(
    //                     padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 10),
    //                     itemCount: searchController.results.length,
    //                     itemBuilder: ((context, index) {
    //                       return Padding(
    //                         padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
    //                         child: GestureDetector(
    //                             onTap: () async {
    //                               // ref.read(weatherListProvider.notifier).saveNewArea('${searchController.results[index].lat},${searchController.results[index].lon}');
    //
    //                               String locationId = '${searchController.results[index].lat},${searchController.results[index].lon}';
    //                               // ref.read(weatherProvider).addTemporaryArea(locationId);
    //                               print('location id: ${locationId} name: ${searchController.results[index].name} stat: ${searchController.results[index].stationId}');
    //                               context.goNamed('weather-details',
    //                                   params: {'lat': '${searchController.results[index].lat}',
    //                                            'lon': '${searchController.results[index].lon}',
    //                                            'name': searchController.results[index].name.isEmpty?' ':searchController.results[index].name,
    //                                            'region': searchController.results[index].region.isEmpty?' ':searchController.results[index].region,
    //                                            'country': searchController.results[index].country.isEmpty?' ':searchController.results[index].country,
    //                                            'provider': searchController.results[index].provider!,
    //                                            'station': searchController.results[index].stationId,
    //                                            'appbar': 'true',
    //                                   }
    //                               );
    //
    //                               ref.read(searchProvider).resetSearch();
    //
    //                             },
    //                             child: Text(
    //                               '${searchController.results[index].type} - ${searchController.results[index].name}, ${searchController.results[index].region}, ${searchController.results[index].country}'.replaceAll(', ,', ','),
    //                               style: context.style.titleMedium?.copyWith(color: Colors.red),
    //                             )),
    //                       );
    //                     }),
    //                   ),
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.bottomCenter,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text('updated @ ${DateFormat('kk:mm').format(updatedAt)}', style: context.style.labelSmall,),
    //                 ),
    //               ),
    //           ],),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

  }

  // String getAlerts(Alerts alerts) {
  //   String maxAlertLevel;
  //   for (Alert alert in alerts.alert!){
  //     print('sev: ${alert.severity}');
  //   }
  //   return 'stuff';
  // }


}

class _SingleWeatherArea extends StatelessWidget {
  final WeatherArea weatherArea;
  const _SingleWeatherArea({required this.weatherArea, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {

        return GestureDetector(

          onTap: () {
            // print('go to details for ${weatherArea.name!} provider ${weatherArea.provider} station: ${weatherArea.stationId} provider: ${weatherArea.provider}');
            context.goNamed('weather-details',
            params: {'lat': '${weatherArea.location!.lat}',
            'lon': '${weatherArea.location!.lon}',
            'name': weatherArea.name??'unknown name',
            'region': weatherArea.region??'unknown region',
            'country': weatherArea.country??'unknown country',
            // 'type': weatherArea.type!.isEmpty?' ':weatherArea.type!,
            'provider': weatherArea.provider==null?'default':weatherArea.provider!,
            'station': weatherArea.stationId??'xxx',
            'appbar': 'true',
            });

            // {'lat': '${weatherArea.location.lat}', 'lon': '${weatherArea.location.lon}', 'name': weatherArea.name!, 'region': weatherArea.region!, 'country': weatherArea.country!});

          },
          child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.primaryContainer.withOpacity(ref.watch(settingsProvider).themeMode==ThemeMode.dark ? 0.1 : 0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weatherArea.name ?? 'unknown name',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'time here',
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    Expanded(child: SizedBox(),),
                      if ((weatherArea.alerts != null) && (weatherArea.alerts!.alert!.isNotEmpty))
                                           Padding(
                                             padding: const EdgeInsets.only(bottom: 4.0),
                                             child: Image.asset('$imagePath/warning.png', width: 12, height: 12, color: getSeverityColor(weatherArea.alerts!.alert!.first.severity!)),
                                           ),
                    Text(weatherArea.current?.condition?.text??'', style: context.style.labelMedium,),
                  ],),
                ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                          Text(
                            Conversion.temperature(weatherArea.current!.tempC!, ref.read(settingsProvider).units).round().toString(),
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: context.colorScheme.onSurface),
                          ),
                          Text(
                            '°',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: context.colorScheme.onSurface),
                          ),
                    ]),
                  ),
                  Expanded(child: SizedBox(),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'H:${Conversion.temperature(weatherArea.forecast!.forecastday!.first.day!.maxtempC!, ref.read(settingsProvider).units).round().toString()}°',
                          style: context.style.labelMedium,
                          maxLines: 1,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'L:${Conversion.temperature(weatherArea.forecast!.forecastday!.first.day!.mintempC!, ref.read(settingsProvider).units).round().toString()}°',
                          style: context.style.labelMedium,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],)
              ]),
              // Stack(
              //   children: [
              //     Positioned(
              //       top: 15, right: 15,
              //       child:                   Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             Conversion.temperature(weatherArea.current!.tempC!, ref.read(settingsProvider).units).round().toString(),
              //             style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: context.colorScheme.onSurface),
              //           ),
              //           Text(
              //             '°',
              //             style: Theme.of(context).textTheme.titleLarge?.copyWith(color: context.colorScheme.onSurface),
              //           ),
              //
              //         ],
              //       ),
              //       // Image.asset(
              //       //   '$imageWeatherIconPath/${weatherArea.current!.isDay==1?'day/':'night/'}${weatherArea.current!.condition?.icon}.png', height: 80, fit: BoxFit.cover,
              //       // ),
              //     ),
              //
              //     Column(
              //       children: [
              //         SizedBox(
              //           height: 60,
              //           //fit: FlexFit.tight,
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisSize: MainAxisSize.max,
              //             children: [
              //               const SizedBox(
              //                 width: 20,
              //               ),
              //
              //             ],
              //           ),
              //         ),
              //         SizedBox(
              //           height: 40,
              //             // flex: 1,
              //             // fit: FlexFit.tight,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 20.0, right: 10),
              //                       child: Text(
              //                         weatherArea.name??'unknown name',
              //                         style: Theme.of(context).textTheme.titleSmall,
              //                         textAlign: TextAlign.start,
              //                         maxLines: 1,
              //                       ),
              //                     ),
              //                     if ((weatherArea.alerts != null) && (weatherArea.alerts!.alert!.isNotEmpty))
              //                       Image.asset('$imagePath/warning.png', width: 12, height: 12, color: getSeverityColor(weatherArea.alerts!.alert!.first.severity!)),
              //
              //                   ],
              //                 ),
              //                 const SizedBox(height: 4,),
              //                 // Row(
              //                 //   children: [
              //                 //     Expanded(
              //                 //       child: Padding(
              //                 //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //                 //         child: Text(
              //                 //           '${weatherArea.region?.toUpperCase()??'unknown region'}',
              //                 //           style: Theme.of(context).textTheme.labelSmall,
              //                 //           maxLines: 1,
              //                 //         ),
              //                 //       ),
              //                 //     ),
              //                 //   ],
              //                 // ),
              //               ],
              //             )),
              //         SizedBox(
              //           height: 20,
              //             // flex: 1,
              //             // fit: FlexFit.tight,
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     children: [
              //                       if (weatherArea.forecast!.forecastday!.isNotEmpty)
              //
              //                         Row(
              //                           mainAxisSize: MainAxisSize.min,
              //                           children: [
              //                             const SizedBox(
              //                               width: 20,
              //                             ),
              //                             // Image.asset('$imagePath/mintemp.png', height: 16, width: 16, color: context.colorScheme.primary),
              //                             // const SizedBox(
              //                             //   width: 5,
              //                             // ),
              //                             Text(
              //                               'L:${Conversion.temperature(weatherArea.forecast!.forecastday!.first.day!.mintempC!, ref.read(settingsProvider).units).round().toString()}°',
              //                               style: context.style.labelMedium,
              //                               maxLines: 1,
              //                             ),
              //                             const SizedBox(
              //                               width: 10,
              //                             ),
              //                           ],
              //                         ),
              //                       Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         children: [
              //                           const SizedBox(
              //                             width: 10,
              //                           ),
              //                           // Image.asset('$imagePath/maxtemp.png', height: 16, width: 16, color: context.colorScheme.primary),
              //                           // const SizedBox(
              //                           //   width: 5,
              //                           // ),
              //                           Text(
              //                             'H:${Conversion.temperature(weatherArea.forecast!.forecastday!.first.day!.maxtempC!, ref.read(settingsProvider).units).round().toString()}°',
              //                             style: context.style.labelMedium,
              //                             maxLines: 1,
              //                           ),
              //                           const SizedBox(
              //                             width: 10,
              //                           ),
              //                         ],
              //                       ),
              //
              //                       //   Row(
              //                       //   mainAxisSize: MainAxisSize.min,
              //                       //   children: [
              //                       //     const SizedBox(
              //                       //       width: 20,
              //                       //     ),
              //                       //     Image.asset(
              //                       //       '$imagePath/rain_chance.png',
              //                       //       height: 16,
              //                       //       width: 16,
              //                       //       color: context.colorScheme.primary,
              //                       //     ),
              //                       //     const SizedBox(
              //                       //       width: 5,
              //                       //     ),
              //                       //     Text(
              //                       //       '${weatherArea.forecast?.forecastday?.first.day?.dailyChanceOfRain??0}',
              //                       //       style: context.style.labelMedium,
              //                       //       maxLines: 1,
              //                       //     ),
              //                       //     Text(
              //                       //       '%',
              //                       //       style: Theme.of(context).textTheme.labelSmall,
              //                       //       maxLines: 1,
              //                       //     ),
              //                       //     const SizedBox(
              //                       //       width: 10,
              //                       //     ),
              //                       //   ],
              //                       // ),
              //                       // Row(
              //                       //   mainAxisSize: MainAxisSize.min,
              //                       //   children: [
              //                       //     const SizedBox(
              //                       //       width: 10,
              //                       //     ),
              //                       //     Image.asset('$imagePath/wind_icon.png', height: 16, width: 16, color: context.colorScheme.primary),
              //                       //     const SizedBox(
              //                       //       width: 5,
              //                       //     ),
              //                       //     Text(
              //                       //       '${Conversion.speed(weatherArea.current!.windKph!, ref.read(settingsProvider).units).round().toString()} ${ref.read(settingsProvider).units.speed}',
              //                       //       style: context.style.labelMedium,
              //                       //       maxLines: 1,
              //                       //     ),
              //                       //     const SizedBox(
              //                       //       width: 10,
              //                       //     ),
              //                       //   ],
              //                       // ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             )),
              //       ],
              //     ),
              //   ],
              // )
        ),
        );

      },
    );


  }
}




class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {

  final FocusNode _focus = FocusNode();
  late WidgetRef widgetRef;
  final _debouncer = Debouncer(delay: const Duration(milliseconds: 250));

  @override
  void initState() {
    super.initState();
    // _controller = TextEditingController();
    _focus.addListener(_onFocusChange);
    // hideKeyboard(context);
  }

  @override
  void dispose() {
    // _controller.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    // debugPrint("Focus: ${_focus.hasFocus.toString()}");
    // if (_focus.hasFocus) {
    //   widgetRef
    //       .read(searchProvider)
    //       .showSearchArea = _focus.hasFocus;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Text('10');

        // widgetRef = ref;
        // return Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListTile(
        //     leading: Icon(
        //       Icons.search,
        //       color: context.colorScheme.primary,
        //     ),
        //     title: TextField(
        //         controller: widgetRef.watch(searchProvider).textEditingController,
        //         focusNode: _focus,
        //         onChanged: (String value) {
        //           _debouncer(() {
        //             ref.read(searchProvider).searchForArea(value.trim(), ref.read(settingsProvider).wundergroundApiKey);
        //           });
        //         },
        //         onSubmitted: (String value) async {
        //           // ref.read(weatherProvider).saveNewArea(value);
        //         }),
        //     trailing: (widgetRef.watch(searchProvider).showSearchArea == false)
        //         ? null
        //         : TextButton(
        //             onPressed: () {
        //               ref.read(searchProvider).resetSearch();
        //               setState(() {
        //                 FocusScope.of(context).unfocus();
        //                 // _controller.clear();
        //               });
        //             },
        //             child: const Text('Cancel')),
        //   ),
        //
        // );
      },

    );
  }

}
