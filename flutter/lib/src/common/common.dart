import 'package:flutter/material.dart';
import 'package:gusty/src/app.dart';

const prefsWeatherAreas = 'prefs_weather_areas';



const imagePath = "assets/images";
const imageWeatherIconPath = "assets/images/weatherIcons";


const List<Color>temperatureGradient = [Color(0xff996ce3), Color(0xff0051ad), Color(0xff6ba1e0), Color(0xff01d058), Color(0xffe38e09), Color(0xfff91200), Color(0xffae0000),];
const List<Color>windGradient = [colorLevel1, colorLevel3, colorLevel4, colorLevel6, colorLevel7, colorLevel8, colorLevel9,];


const List<Color>rainGradient = [Color(0xff293746),Color(0xff263A4E),Color(0xff203F5F),Color(0xff134C82),Color(0xff24529E),Color(0xff8C4A9A),Color(0xffF95371), Color(0xffFFB56E),Color(0xffFFF80B),Color(0xffFFFD05), Color(0xffFFFD05), Color(0xffF5F305) ];
const List<Color>snowGradient = [Color(0xff8CFCFF), Color(0xff1272FE)];



void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}


bool isLargeTablet(BuildContext context) {
  return MediaQuery.of(context).size.width >= 840;
}

bool isSmallTablet(BuildContext context) {
  return MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 839;
}

bool isHandset(BuildContext context) {
  return MediaQuery.of(context).size.width <= 599;
}


int getIconNumber(String inputCode, String provider){
  // print('incput code $inputCode provider $provider');
  if (inputCode=='null'){
    inputCode = '44';
  }
  if (provider=='weatherapi'){
  switch (int.parse(inputCode)) {
    case 1000: return 113;
    case 1003: return 116;
    case 1006: return 119;
    case 1009: return 122;
    case 1030: return  143;
    case 1063: return  176;
    case 1066: return  179;
    case 1069: return  182;
    case 1072: return  185;
    case 1087: return  200;
    case 1114: return  227;
    case 1117: return  230;
    case 1135: return  248;
    case 1147: return  260;
    case 1150: return  263;
    case 1153: return  266;
    case 1168: return  281;
    case 1171: return  284;
    case 1180: return  293;
    case 1183: return  296;
    case 1186: return  299;
    case 1189: return  302;
    case 1192: return  305;
    case 1195: return  308;
    case 1198: return  311;
    case 1201: return  314;
    case 1204: return  317;
    case 1207: return  320;
    case 1210: return  323;
    case 1213: return  326;
    case 1216: return  329;
    case 1219: return  332;
    case 1222: return  335;
    case 1225: return  338;
    case 1237: return  350;
    case 1240: return  353;
    case 1243: return  356;
    case 1246: return  359;
    case 1249: return  362;
    case 1252: return  365;
    case 1255: return  368;
    case 1258: return  371;
    case 1261: return  374;
    case 1264: return  377;
    case 1273: return  386;
    case 1276: return  389;
    case 1279: return  392;
    case 1282: return  395;

    }
  }
  else if (provider=='7timer'){
    switch(inputCode){
      case 'clearday':
      case 'clear':
      case 'clearnight':
        return 113;
      case 'pcloudyday':
      case 'pcloudy':
      case 'pcloudynight':
        return 116;
      case 'mcloudyday':
      case 'mcloudy':
      case 'mcloudynight':
        return 119;
      case 'cloudy':
      case 'cloudyday':
      case 'cloudynight':
        return 122;
      case 'humid':
      case 'humidday':
      case 'humidnight':
        return 116;
      case 'lightrain':
      case 'lightrainday':
      case 'lightrainnight':
        return 296;
      case 'oshower':
      case 'oshowerday':
      case 'oshowernight':
        return 296;
      case 'ishower':
      case 'ishowerday':
      case 'ishowernight':
        return 176;
      case 'lightsnow':
      case 'lightsnowday':
      case 'lightsnownight':
        return 332;
      case 'rain':
      case 'rainday':
      case 'rainnight':
        return 308;
      case 'snow':
      case 'snowday':
      case 'snownight':
        return 338;
      case 'rainsnow':
      case 'rainsnowday':
      case 'rainsnownight':
        return 317;
    }
  }
  else{
    switch (int.parse(inputCode)) {
      case 0: return 1000;
      case 1: return 1001;
      case 2: return 1001;
      case 3: return 389;
      case 4: return 389;
      case 5: return 317;
      case 6: return 317;
      case 7: return 317;
      case 8: return 281;
      case 9: return 296;
      case 10: return 311;
      case 11: return 296;
      case 12: return 308;
      case 13: return 326;
      case 14: return 338;
      case 15: return 338;
      case 16: return 338;
      case 17: return 350;
      case 18: return 314;
      case 19: return 248;
      case 20: return 248;
      case 21: return 248;
      case 22: return 248;
      case 23: return 1003;
      case 24: return 1003;
      case 25: return 1004;
      case 26: return 119;
      case 27: return 119;
      case 28: return 116;
      case 29: return 116;
      case 30: return 116;
      case 31: return 113;
      case 32: return 113;
      case 33: return 116;
      case 34: return 113;
      case 35: return 350;
      case 36: return 113;
      case 37: return 386;
      case 38: return 386;
      case 39: return 302;
      case 40: return 302;
      case 41: return 323;
      case 42: return 338;
      case 43: return 338;
      case 44: return 1002;
      case 45: return 176;
      case 46: return 323;
      case 47: return 386;
    }
  }
  return 44;
}


Color getColorForTemperature(double tempC){
  double tempToUse = tempC.clamp(-30, 45);  //clamp for the scale
  Animatable<Color?> animationColor = TweenSequence([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: temperatureGradient[0],
        end: temperatureGradient[1],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: temperatureGradient[1],
        end: temperatureGradient[2],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: temperatureGradient[2],
        end: temperatureGradient[3],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: temperatureGradient[3],
        end: temperatureGradient[4],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: temperatureGradient[4],
        end: temperatureGradient[5],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: temperatureGradient[5],
        end: temperatureGradient[6],
      ),
    )
  ]);


  int inputEnd = -30;
  int inputStart = 45;
  int outputStart = 1;
  int outputEnd = 0;
  int inputRange = inputEnd - inputStart;
  int outputRange = outputEnd - outputStart;

  double output = (tempToUse - inputStart)*outputRange / inputRange + outputStart;

  return animationColor.transform(output) ?? Colors.blue;
}


Color getColorForWind(double windKm){
  double windToUse = windKm.clamp(0, 140);  //clamp for the scale
  Animatable<Color?> animationColor = TweenSequence([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: windGradient[0],
        end: windGradient[1],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: windGradient[1],
        end: windGradient[2],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: windGradient[2],
        end: windGradient[3],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: windGradient[3],
        end: windGradient[4],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: windGradient[4],
        end: windGradient[5],
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: windGradient[5],
        end: windGradient[6],
      ),
    )
  ]);


  int inputEnd = 0;
  int inputStart = 140;
  int outputStart = 1;
  int outputEnd = 0;
  int inputRange = inputEnd - inputStart;
  int outputRange = outputEnd - outputStart;

  double output = (windToUse - inputStart)*outputRange / inputRange + outputStart;

  return animationColor.transform(output) ?? Colors.blue;
}


getSeverityColor(String severity) {
  if (severity=='Moderate'){
    return colorLevel5;
  }
  else if (severity=='Minor'){
    return colorLevel1;
  }
  else if (severity=='Major'){
    return colorLevel8;
  }
  else{
    return colorLevel3;
  }
}