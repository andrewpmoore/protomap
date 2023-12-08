// class ObservationChartTemperature extends ConsumerWidget {
//   const ObservationChartTemperature({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     WeatherAreasProvider weatherProv = ref.watch(weatherProvider);
//     if (weatherProv.todayObservations==null){
//       return const SizedBox();
//     }
//     return Container();
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/common/common.dart';
import 'package:gusty/src/common/conversion.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/models/wunderground_today_observations.dart';
import 'package:gusty/src/shared_providers/weather_areas_provider.dart';
import 'dart:math';


class ChartWindAndGustObservations extends ConsumerStatefulWidget {
  // final bool includeWind;
  final bool includeGust;
  const ChartWindAndGustObservations({Key? key, required this.includeGust}) : super(key: key);

  @override
  ChartTemperatureObservationsState createState() => ChartTemperatureObservationsState();
}

class ChartTemperatureObservationsState extends ConsumerState<ChartWindAndGustObservations> {


  // bool showAvg = false;

  late List<Color> gradientColors;
  late List<Color> gradientColorsGust;
  double minWind = 100;
  double maxWind = -100;
  late DateTime minWindTime;
  late DateTime maxWindTime;

  double minGust = 100;
  double maxGust = -100;
  late DateTime minGustTime;
  late DateTime maxGustTime;

  @override
  Widget build(BuildContext context,) {
    return Text('7');

    // WeatherAreasProvider weatherProv = ref.watch(weatherProvider);
    //
    // if (weatherProv.singleWeatherArea!.todayObservations==null) {
    //   return const SizedBox();
    // }
    //
    // setMinAndMaxWindAndGust(weatherProv);
    // gradientColors = getGradientColors(weatherProv);
    // gradientColorsGust = getGradientColorsGust(weatherProv);
    //
    //
    // return Stack(
    //   children: <Widget>[
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
    //       child: SizedBox(
    //         height: 280,
    //         child: Container(
    //           decoration: BoxDecoration(
    //               borderRadius: const BorderRadius.all(
    //                 Radius.circular(16),
    //               ),
    //               color: context.colorScheme.surface),
    //           child: Padding(
    //             padding: const EdgeInsets.only(
    //                 right: 18.0, left: 12.0, top: 65, bottom: 12),
    //             child: LineChart(
    //               mainData(weatherProv.singleWeatherArea!.todayObservations!),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(left: 30.0, top: 10),
    //       child: Row(
    //         children: [
    //           Image.asset('$imagePath/wind_icon.png', width: 24, height: 24, color: context.colorScheme.tertiary,),
    //           const SizedBox(width: 20,),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(widget.includeGust?'Wind and gust speed':'Wind speed',),
    //               Text('Wind: ↑ ${Conversion.speed(maxWind, ref.read(settingsProvider).units).toStringAsFixed(1)} ${ref.read(settingsProvider).units.speed} @ ${Conversion.time(maxWindTime, ref.read(settingsProvider).units)}', style: context.style.labelSmall,),
    //               if (widget.includeGust) Text('Gust: ↑ ${Conversion.speed(maxGust, ref.read(settingsProvider).units).toStringAsFixed(1)} ${ref.read(settingsProvider).units.speed} @ ${Conversion.time(maxGustTime, ref.read(settingsProvider).units)}', style: context.style.labelSmall,),
    //
    //               //Conversion.time(area.current.tempC, ref.read(settingsProvider).units)
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {

    Widget text;
    switch (value.toInt()) {
      default:
        text = Text(Conversion.time(DateTime(2000, 1, 1,0,0,0,0).add(Duration(minutes: value.toInt()*5)), ref.read(settingsProvider).units), style: context.style.labelSmall);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      default:
        text = '${Conversion.speed(value, ref.read(settingsProvider).units).toStringAsFixed(1)} ${ref.read(settingsProvider).units.speed}';
    }

    return Text(text, style: context.style.labelSmall, textAlign: TextAlign.left);
  }

  LineChartData mainData(WundergroundTodayObservations? todayObservations) {




    List<FlSpot> flSpotWindList = [];
    List<FlSpot> flSpotGustList = [];
    for (int i=0; i<todayObservations!.observations.length; i++){
      Observation observation = todayObservations.observations[i];
      flSpotWindList.add(FlSpot(i.toDouble(), observation.metric!['windspeedHigh']!));
      if (widget.includeGust) {
        flSpotGustList.add(FlSpot(i.toDouble(), observation.metric!['windgustHigh']!));
      }
    }



    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
          touchTooltipData: LineTouchTooltipData()
          // touchTooltipData: TouchTooltipData (
          //     tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
          //         .
          //     .
          //     .
          // )
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1 ,//widget.includeGust ? maxGust/5 : maxWind/5==0?1:widget.includeGust ? maxGust/5 : maxWind/5,
        verticalInterval: 5,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: context.colorScheme.tertiary.withOpacity(0.25),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: todayObservations.observations.length<=5 ? todayObservations.observations.length.toDouble() : todayObservations.observations.length/5,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval:  widget.includeGust ? maxGust/5 : maxWind/5==0?1:widget.includeGust ? maxGust/5 : maxWind/5,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: todayObservations.observations.length.toDouble(),
      minY: 0,
      maxY: widget.includeGust ? max(maxGust, maxWind) : maxWind,
      lineBarsData: [
        LineChartBarData(
          spots: flSpotWindList,
          isCurved: false,
          isStrokeJoinRound: false,
          // curveSmoothness: 100,
          preventCurveOverShooting: true,
          isStepLineChart: false,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          // belowBarData: BarAreaData(
          //   show: true,
          //   gradient: LinearGradient(
          //     colors: gradientColors
          //         .map((color) => color.withOpacity(0.3))
          //         .toList(),
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //   ),
          // ),
        ),
        if (widget.includeGust) LineChartBarData(
          spots: flSpotGustList,
          // isCurved: false,
          // isStrokeJoinRound: false,
          // curveSmoothness: 100,
          // preventCurveOverShooting: true,
          // isStepLineChart: false,
          // gradient: LinearGradient(
          //   colors: gradientColorsDew,
          //   begin: Alignment.bottomCenter,
          //   end: Alignment.topCenter,
          // ),
          barWidth: 0,
          // isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            // getDotPainter: ,
            checkToShowDot: (spot, barData) {
              if (spot.y==0){
                return false;
              }
              else{
                return true;
              }
            },
            getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                    radius: 2,
                    color: const Color(0xffe58301),
                    // strokeWidth: 0,
                    // strokeColor: const Color(0xff01cc96)
                );
            },
          ),
          // belowBarData: BarAreaData(
          //   show: true,
          //   gradient: LinearGradient(
          //     colors: gradientColors
          //         .map((color) => color.withOpacity(0.3))
          //         .toList(),
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //   ),
          // ),
        )
      ],
    );
  }

  List<Color> getGradientColors(WeatherAreasProvider weatherProv) {
    List<Color> gradientColors = [];
    for (int i=minWind.toInt(); i<=maxWind.toInt(); i++){
      gradientColors.add(getColorForWind(i.toDouble()));
    }
    if (gradientColors.isEmpty){
      gradientColors.add(Colors.orange);
    }
    if (gradientColors.length==1){
      gradientColors.add(Colors.orange);
    }
    return gradientColors;
  }

  List<Color> getGradientColorsGust(WeatherAreasProvider weatherProv) {
    List<Color> gradientColors = [Colors.green, Colors.green];
    return gradientColors;
  }

  void setMinAndMaxWindAndGust(WeatherAreasProvider weatherProv) {
    for (int i=0; i<weatherProv.singleWeatherArea!.todayObservations!.observations.length; i++){
      Observation observation = weatherProv.singleWeatherArea!.todayObservations!.observations[i];
      double highWind = observation.metric!['windspeedHigh']!;
      double highGust = observation.metric!['windgustHigh']!;
      if (highWind<minWind){
        minWind = highWind;
        minWindTime = observation.obsTimeLocal;
      }
      if (highWind>maxWind){
        maxWind = highWind;
        maxWindTime = observation.obsTimeLocal;
      }
      if (highGust<minGust){
        minGust = highGust;
        minGustTime = observation.obsTimeLocal;
      }
      if (highGust>maxGust){
        maxGust = highGust;
        maxGustTime = observation.obsTimeLocal;
      }

    }
  }

}