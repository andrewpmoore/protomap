import 'dart:async';

import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/common/common.dart';
import 'package:gusty/src/common/conversion.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/models/rain_viewer.dart';
import 'package:gusty/src/models/weather_area.dart';
import 'package:gusty/src/shared_providers/weather_areas_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';


/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  late final MapController mapController;
  RainViewer? rainViewer;
  DateTime? lastTimeRainObtained;
  bool playing = false;

  Timer? timer;

  List<Nowcast> radarList = [];
  int imageToShow = 0;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }


  @override
  void dispose() {
    playing = false;
    if (timer!=null) {
      timer?.cancel();
    }
    mapController.dispose();
    super.dispose();
  }

  Future<RainViewer> getRainRadarView() async {
    final Dio client = Dio();
    final result = await client.get('https://api.rainviewer.com/public/weather-maps.json',);
    if (result.statusCode == 200) {
      RainViewer rv = RainViewer.fromJson(result.data);
      return rv;
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // final provider = ref.watch(settingsProvider);
        return Text('8');

        // WeatherAreasProvider weatherProv = ref.watch(weatherProvider);
        // List<WeatherArea> weatherAreas = weatherProv.weatherAreaFavourites;
        //
        // bool noAreasYet = weatherAreas.isEmpty;
        //
        // List<LatLng> points = noAreasYet ? [LatLng(0,0)]:  weatherAreas.map((e) => LatLng(e.location!.lat!, e.location!.lon!)).toList();
        // // LatLngBounds bounds = LatLngBounds.fromPoints([points.first]);
        //
        // // double minLat = 10000;
        // // double maxLat = -10000;
        // // double minLon = 10000;
        // // double maxLon = -10000;
        // //
        // //
        // // for (WeatherArea area in weatherAreas){
        // //   if (area.location.lat>maxLat){
        // //     maxLat = area.location.lat;
        // //   }
        // //   if (area.location.lon>maxLon){
        // //     maxLon = area.location.lon;
        // //   }
        // //   if (area.location.lat<minLat){
        // //     minLat = area.location.lat;
        // //   }
        // //   if (area.location.lon<minLon){
        // //     minLon = area.location.lon;
        // //   }
        // // }
        // return Scaffold(
        //   backgroundColor: Colors.transparent,
        //   body: Stack(
        //     children: [
        //       FlutterMap(
        //         mapController: mapController,
        //         options: MapOptions(
        //             maxZoom: 18,
        //             maxBounds: LatLngBounds(LatLng(-90, -180.0), LatLng(90.0, 180.0)),
        //             interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        //             center: points.first,
        //             zoom: noAreasYet ? 3 : 8,
        //             onPositionChanged: (MapPosition position, bool hasGesture) async {
        //               //sort out the call to add on the radar view
        //               if (DateTime.now().subtract(const Duration(minutes: 10)).isAfter(lastTimeRainObtained ?? DateTime.now().subtract(const Duration(hours: 1)))) {
        //                 rainViewer = await getRainRadarView();
        //                 // print('map position ${position.zoom}, ${position.center!.latitude} / ${position.center!.longitude} show ');
        //                 //   'x': coords.x.round().toString(),
        //                 // 'y': coords.y.round().toString(),
        //                 // 'z': z.round().toString(),
        //                 radarList = [...rainViewer!.radar.past, ...rainViewer!.radar.nowcast];
        //                 if (mounted) {
        //                   setState(() {
        //                     imageToShow = rainViewer!.radar.past.length;
        //                     lastTimeRainObtained = DateTime.now();
        //                   });
        //                 }
        //               } else {
        //                 // print('got data too recently');
        //               }
        //             }
        //             ),
        //
        //         layers: [
        //           TileLayerOptions(
        //             overrideTilesWhenUrlChanges: false,
        //             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        //             subdomains: ['a', 'b', 'c'],
        //             tileProvider: NetworkTileProvider(),
        //             backgroundColor: Colors.transparent,
        //             tilesContainerBuilder: darkTilesContainerBuilder,
        //           ),
        //           // for (int i=0; i<=radarList.length; i++)
        //           if (radarList.isNotEmpty) TileLayerOptions(
        //             urlTemplate: "https://tilecache.rainviewer.com${radarList[imageToShow].path}/512/{z}/{x}/{y}/8/1_1.png",
        //             backgroundColor: Colors.transparent,
        //             tileFadeInStartWhenOverride: 1,
        //             tileFadeInStart: 1,
        //             opacity: 0.7,
        //             tileFadeInDuration: 0,
        //           ),
        //           if (radarList.isNotEmpty) TileLayerOptions(
        //             urlTemplate: "https://tilecache.rainviewer.com${radarList[getImageToShowOffset(1)].path}/512/{z}/{x}/{y}/8/1_1.png",
        //             backgroundColor: Colors.transparent,
        //             tileFadeInStartWhenOverride: 1,
        //             tileFadeInStart: 1,
        //             opacity: 0,
        //             tileFadeInDuration: 0,
        //           ),
        //           if (radarList.isNotEmpty) TileLayerOptions(
        //             urlTemplate: "https://tilecache.rainviewer.com${radarList[getImageToShowOffset(2)].path}/512/{z}/{x}/{y}/8/1_1.png",
        //             backgroundColor: Colors.transparent,
        //             tileFadeInStartWhenOverride: 1,
        //             tileFadeInStart: 1,
        //             opacity: 0,
        //             tileFadeInDuration: 0,
        //           ),
        //
        //
        //           // if (radarList.isNotEmpty) TileLayerOptions(
        //           //     backgroundColor: Colors.transparent,
        //           //     urlTemplate:
        //           //     "https://tile.openweathermap.org/map/pressure_new/{z}/{x}/{y}.png?appid=810cfa267d0ebfe3d033a3f89ebae88a"
        //           // ),
        //           // OverlayImageLayerOptions(
        //           //     overlayImages:[OverlayImage(
        //           //     bounds: LatLngBounds(points.first, points[1]),
        //           //     opacity: 0.8,
        //           //     imageProvider: const NetworkImage(
        //           //         'https://images.pexels.com/photos/231009/pexels-photo-231009.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=600'))]),
        //           MarkerLayerOptions(
        //             markers: [
        //               for (WeatherArea area in weatherAreas)
        //                 Marker(width: 32,
        //                     height: 32,
        //                     point: LatLng(area.location!.lat!, area.location!.lon!),
        //                     builder: (ctx) =>
        //                         GestureDetector(
        //                           onTap: (){
        //                             print('tapped on ${area.location!.name}');
        //                           },
        //                           child: Stack(
        //                             children: [
        //                               Image.asset('$imagePath/pin.png', color: getColorForTemperature(area.current!.tempC!),),
        //                               Padding(
        //                                 padding: const EdgeInsets.only(bottom: 6.0),
        //                                 child: Center(
        //                                   // left: 8,
        //                                   // top: 7,
        //                                     child: Text('${Conversion.temperature(area.current!.tempC!, ref
        //                                         .read(settingsProvider)
        //                                         .units).round().toString()}°', style: context.style.labelMedium?.copyWith(color: Colors.white),)),
        //                               )
        //                             ],
        //                           ),
        //                         ))
        //             ],
        //           ),
        //         ],
        //         // nonRotatedChildren: [
        //         //   Opacity(
        //         //     opacity: 0.3,
        //         //     child: AttributionWidget.defaultWidget(
        //         //       source: 'OpenStreetMap contributors',
        //         //       onSourceTapped: () {},
        //         //     ),
        //         //   ),
        //         // ],
        //       ),
        //       Positioned(top: 20, left: 20,
        //           child: SafeArea(
        //             child: Column(
        //               children: [
        //                 SizedBox(
        //                   width: 200,
        //                   child: Row(mainAxisSize: MainAxisSize.max, children: [
        //                     Expanded(
        //                       child: Opacity(
        //                         opacity: 0.8,
        //                         child: Container(
        //                             width: 200,
        //                             height: 16,
        //                             decoration: const BoxDecoration(
        //                               borderRadius: BorderRadius.all(Radius.circular(16)),
        //                               gradient: LinearGradient(
        //                                 begin: Alignment.centerLeft,
        //                                 end: Alignment.centerRight,
        //                                 colors: rainGradient,
        //                               ),
        //                             )),
        //                       ),
        //                     ),
        //                       const SizedBox(width: 10,),
        //                       SizedBox(width: 40, child: Text('Rain', style: context.style.labelMedium)),
        //                   ]),
        //
        //                 ),
        //                 const SizedBox(height: 5,),
        //                 SizedBox(
        //                   width: 200,
        //                   child: Row(mainAxisSize: MainAxisSize.max, children: [
        //                     Expanded(
        //                       child: Opacity(
        //                         opacity: 0.8,
        //                         child: Container(
        //                             width: 200,
        //                             height: 16,
        //                             decoration: const BoxDecoration(
        //                               borderRadius: BorderRadius.all(Radius.circular(16)),
        //                               gradient: LinearGradient(
        //                                 begin: Alignment.centerLeft,
        //                                 end: Alignment.centerRight,
        //                                 colors: snowGradient,
        //                               ),
        //                             )),
        //                       ),
        //                     ),
        //                     const SizedBox(width: 10,),
        //                     SizedBox(width: 40, child: Text('Snow', style: context.style.labelMedium)),
        //
        //                   ])
        //
        //                 ),
        //                 SizedBox(height: 15,),
        //                 Column(
        //                   children: [
        //                     SizedBox(width: 200,child: Row(
        //                         mainAxisSize: MainAxisSize.max,
        //                         children: [Expanded(child:
        //                         Opacity(
        //                           opacity: 0.8,
        //                           child: Container(
        //                               width: 200,
        //                               height: 16,
        //                               decoration: const BoxDecoration(
        //                                 borderRadius: BorderRadius.all(Radius.circular(16)),
        //                                 gradient: LinearGradient(
        //                                   begin: Alignment.centerLeft,
        //                                   end: Alignment.centerRight,
        //                                   colors: temperatureGradient,
        //                                 ),
        //                               )),
        //                         ),
        //
        //                         ), const SizedBox(width: 10,),SizedBox(width: 40, child: Text('Temp',style: context.style.labelMedium))]),),
        //                     SizedBox(width: 200, child: Row(
        //                         mainAxisSize: MainAxisSize.max,
        //
        //                         children: [Expanded(child:
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                           mainAxisSize: MainAxisSize.max,
        //                           children:  [
        //                             Text(Conversion.temperature(-30, ref.read(settingsProvider).units).round().toString(), style: context.style.labelMedium,),
        //                             Text(Conversion.temperature(-15, ref.read(settingsProvider).units).round().toString(), style: context.style.labelMedium,),
        //                             Text(Conversion.temperature(0, ref.read(settingsProvider).units).round().toString(), style: context.style.labelMedium,),
        //                             Text(Conversion.temperature(15, ref.read(settingsProvider).units).round().toString(), style: context.style.labelMedium,),
        //                             Text(Conversion.temperature(30, ref.read(settingsProvider).units).round().toString(), style: context.style.labelMedium,),
        //                             Text(Conversion.temperature(45, ref.read(settingsProvider).units).round().toString(), style: context.style.labelMedium,),
        //                           ],
        //                         ),), const SizedBox(width: 10,),SizedBox(width: 40, child: Text('°${ref.read(settingsProvider).units.temperature.toUpperCase()}',style: context.style.labelMedium))])),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           )),
        //       if (radarList.isNotEmpty) Positioned(
        //             bottom: 20,
        //             right: 20,
        //             child: Column(
        //               children: [
        //                 Text('${DateTime.fromMillisecondsSinceEpoch(radarList[imageToShow].time * 1000).isBefore(DateTime.now())?'Past': 'Forcast'} ${Conversion.time(DateTime.fromMillisecondsSinceEpoch(radarList[imageToShow].time * 1000), ref.read(settingsProvider).units)}'   ),
        //                 const SizedBox(height: 5,),
        //                 Row(
        //                   children: [
        //                     FloatingActionButton(
        //                       // backgroundColor: context.colorScheme.surface,
        //                       onPressed: (){
        //                               setState(() {
        //                                 timer?.cancel();
        //                                 playing = false;
        //                                 previousImage();
        //                               });
        //                     }, mini: true,child: const Icon(Icons.arrow_left, color: Colors.red,),),
        //                     const SizedBox(width: 5,),
        //                     FloatingActionButton(
        //                       backgroundColor: Colors.blue,
        //                       onPressed: () {
        //                         if (playing) {
        //                           timer?.cancel();
        //                           setState(() {
        //                             playing = !playing;
        //                           });
        //                         } else {
        //                           timer = Timer.periodic(
        //                             const Duration(milliseconds: 1000),
        //                             (timer) {
        //                               // Update user about remaining time
        //                               setState(() {
        //                                 nextImage();
        //                               });
        //                             },
        //                           );
        //                           setState(() {
        //                             playing = !playing;
        //                           });
        //                         }
        //                       },
        //                       child: Icon(
        //                         playing ? Icons.pause : Icons.play_arrow,
        //                         // color: Colors.green,
        //                       ),
        //                     ),
        //                     const SizedBox(width: 5,),
        //                     FloatingActionButton(
        //                       // backgroundColor: context.colorScheme.surface,
        //                       onPressed: (){
        //                         setState(() {
        //                           timer?.cancel();
        //                           playing = false;
        //                           nextImage();
        //                         });
        //                       }, mini: true,child: const Icon(Icons.arrow_right, color: Colors.red,),)
        //                   ],
        //                 ),
        //
        //               ],
        //             ),
        //       ),
        //       Positioned(bottom: 5, left: 5, child: GestureDetector(onTap:() async{
        //         Uri uri = Uri.parse("https://www.openstreetmap.org/copyright");
        //         if (await canLaunchUrl(uri)){
        //         await launchUrl(uri,mode: LaunchMode.externalApplication);
        //         } else {
        //         // can't launch url
        //         }
        //
        // },child: Text('© OpenStreetMap contributors', style: context.style.labelSmall,))),
        //       // if (radarList.isNotEmpty)SafeArea(
        //       //   child: Row(
        //       //     children: [
        //       //       Text(DateFormat.Hms().format((DateTime.fromMillisecondsSinceEpoch(radarList[imageToShow].time * 1000)))),
        //       //       ElevatedButton(onPressed: () {
        //       //         setState(() {
        //       //           previousImage();
        //       //         });
        //       //       }, child: const Text('Prev')),
        //       //       ElevatedButton(onPressed: (){
        //       //         if (playing){
        //       //           timer?.cancel();
        //       //         }
        //       //         else{
        //       //           timer = Timer.periodic(
        //       //             const Duration(seconds: 1),
        //       //                 (timer) {
        //       //               // Update user about remaining time
        //       //                   setState(() {
        //       //                     nextImage();
        //       //                   });
        //       //             },
        //       //           );
        //       //           setState(() {
        //       //             playing=!playing;
        //       //           });
        //       //
        //       //         }
        //       //       }, child: Text(playing?'Stop':'Play')),
        //       //       ElevatedButton(onPressed: () {
        //       //         setState(() {
        //       //           nextImage();
        //       //         });
        //       //       }, child: const Text('Next')),
        //       //     ],
        //       //   ),
        //       // )
        //     ],
        //   ),
        // );
      },
    );
  }

  int getImageToShowOffset(int offset) {
    int nextImage = imageToShow + offset;
    if (nextImage>radarList.length-1){
      nextImage = 0;
    }
    return nextImage;
  }

  void previousImage() {
    if (imageToShow!=0) {
      imageToShow--;
    }
    else {
      imageToShow = radarList.length-1;
    }
  }

  void nextImage() {
    if (radarList.length - 1 > imageToShow) {
      imageToShow++;
    }
    else {
      imageToShow = 0;
    }
  }


}

class MapColorFilter extends StatelessWidget {
  const MapColorFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}






Widget darkTilesContainerBuilder(BuildContext context,
    Widget tilesContainer,
    List<Tile> tiles,) {

  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final themeMode = ref.watch(settingsProvider.select((s) => s.themeMode));

      bool darkMode = false;
      if (themeMode==ThemeMode.system){
        darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
      } else if(themeMode==ThemeMode.dark){
        darkMode = true;
      }
      else{
        darkMode = false;
      }

      return darkMode ? ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Color(0xffeef8fc),
          BlendMode.difference,
        ),
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Color(0xff343436),
            BlendMode.saturation,
          ),
          child: tilesContainer,
        ),
      ) : ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Color(0xff343436),
          BlendMode.saturation,
        ),
        child: tilesContainer,
      );
    },
  );





}


