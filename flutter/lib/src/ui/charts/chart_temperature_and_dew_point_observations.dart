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
import 'package:intl/intl.dart';


class ChartTemperatureAndDewPointObservations extends ConsumerStatefulWidget {
  final bool includeDewPoint;
  const ChartTemperatureAndDewPointObservations({Key? key, required this.includeDewPoint}) : super(key: key);

  @override
  ChartTemperatureObservationsState createState() => ChartTemperatureObservationsState();
}

class ChartTemperatureObservationsState extends ConsumerState<ChartTemperatureAndDewPointObservations> {


  // bool showAvg = false;

  late List<Color> gradientColors;
  late List<Color> gradientColorsDew;
  double minTemp = 100;
  double maxTemp = -100;
  late DateTime minTime;
  late DateTime maxTime;

  double minDew = 100;
  double maxDew = -100;
  late DateTime minDewTime;
  late DateTime maxDewTime;

  @override
  Widget build(BuildContext context,) {
    return Text('5');
    // WeatherAreasProvider weatherProv = ref.watch(weatherProvider);
    //
    // if (weatherProv.singleWeatherArea!.todayObservations==null) {
    //   return const SizedBox();
    // }
    //
    // setMinAndMaxAndDewTemp(weatherProv);
    // gradientColors = getGradientColors(weatherProv);
    // gradientColorsDew = getGradientColorsDew(weatherProv);
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
    //               mainData(weatherProv.singleWeatherArea!.todayObservations),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(left: 30.0, top: 10),
    //       child: Row(
    //         children: [
    //           Image.asset('$imagePath/thermometer.png', width: 24, height: 24, color: context.colorScheme.tertiary,),
    //           const SizedBox(width: 20,),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(widget.includeDewPoint?'Temperature (${weatherProv.singleWeatherArea!.todayObservations?.observations.last.metric!['tempHigh']}°) and Dew point':'Temperature ${weatherProv.singleWeatherArea!.todayObservations?.observations.last.metric!['tempHigh']}°',),
    //               Text('Temp: ↓ ${Conversion.temperature(minTemp, ref.read(settingsProvider).units)}° @ ${Conversion.time(minTime, ref.read(settingsProvider).units)}   ↑ ${Conversion.temperature(maxTemp, ref.read(settingsProvider).units)}° @ ${Conversion.time(maxTime, ref.read(settingsProvider).units)}', style: context.style.labelSmall,),
    //               if (widget.includeDewPoint) Text('Dew: ↓ ${Conversion.temperature(minDew, ref.read(settingsProvider).units)}° @ ${Conversion.time(minDewTime, ref.read(settingsProvider).units)}   ↑ ${Conversion.temperature(maxDew, ref.read(settingsProvider).units)}° @ ${Conversion.time(maxDewTime, ref.read(settingsProvider).units)}', style: context.style.labelSmall,),
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
        text = '${Conversion.temperature(value, ref.read(settingsProvider).units).toStringAsFixed(1)}°';
    }

    return Text(text, style: context.style.labelSmall, textAlign: TextAlign.left);
  }

  LineChartData mainData(WundergroundTodayObservations? todayObservations) {




    List<FlSpot> flSpotList = [];
    List<FlSpot> flSpotListDew = [];
    for (int i=0; i<todayObservations!.observations.length; i++){
      Observation observation = todayObservations.observations[i];
      flSpotList.add(FlSpot(i.toDouble(), observation.metric!['tempHigh']!));
      if (widget.includeDewPoint) {
        flSpotListDew.add(FlSpot(i.toDouble(), observation.metric!['dewptHigh']!));
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
        horizontalInterval: (maxTemp-minTemp)/4==0?1:(maxTemp-minTemp)/4,
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
            interval: (maxTemp-minTemp)/4==0?1:(maxTemp-minTemp)/4,
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
      minY: widget.includeDewPoint ? minDew : minTemp,
      maxY: maxTemp,
      lineBarsData: [
        LineChartBarData(
          spots: flSpotList,
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
        if (widget.includeDewPoint) LineChartBarData(
          spots: flSpotListDew,
          isCurved: false,
          isStrokeJoinRound: false,
          // curveSmoothness: 100,
          preventCurveOverShooting: true,
          isStepLineChart: false,
          gradient: LinearGradient(
            colors: gradientColorsDew,
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
        )
      ],
    );
  }

  List<Color> getGradientColors(WeatherAreasProvider weatherProv) {
    List<Color> gradientColors = [];
    for (int i=minTemp.toInt(); i<=maxTemp.toInt(); i++){
      gradientColors.add(getColorForTemperature(i.toDouble()));
    }
    if (gradientColors.isEmpty){
      gradientColors.add(Colors.orange);
    }
    if (gradientColors.length==1){
      gradientColors.add(Colors.orange);
    }
    return gradientColors;
  }

  List<Color> getGradientColorsDew(WeatherAreasProvider weatherProv) {
    List<Color> gradientColors = [];
    for (int i=minDew.toInt(); i<=maxDew.toInt(); i++){
      gradientColors.add(getColorForTemperature(i.toDouble()));
    }
    if (gradientColors.isEmpty){
      gradientColors.add(Colors.orange);
    }
    if (gradientColors.length==1){
      gradientColors.add(Colors.orange);
    }
    return gradientColors;
  }

  void setMinAndMaxAndDewTemp(WeatherAreasProvider weatherProv) {
    for (int i=0; i<weatherProv.singleWeatherArea!.todayObservations!.observations.length; i++){
      Observation observation = weatherProv.singleWeatherArea!.todayObservations!.observations[i];
      double highTemp = observation.metric!['tempHigh']!;
      double highDew = observation.metric?['dewptHigh']??0;
      if (highTemp<minTemp){
        minTemp = highTemp;
        minTime = observation.obsTimeLocal;
      }
      if (highTemp>maxTemp){
        maxTemp = highTemp;
        maxTime = observation.obsTimeLocal;
      }
      if (highDew<minDew){
        minDew = highDew;
        minDewTime = observation.obsTimeLocal;
      }
      if (highDew>maxDew){
        maxDew = highDew;
        maxDewTime = observation.obsTimeLocal;
      }

    }
  }

}