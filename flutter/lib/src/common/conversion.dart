import 'package:gusty/src/models/units.dart';
import 'package:intl/intl.dart';

class Conversion {
  static double temperature(double value, Units units) {
    if (units.temperature == 'c') {
      return value;
    } else if (units.temperature == 'f') {
      return (value * 9 / 5 + 32);
    } else if (units.temperature == 'K') {
      return value + 273.15;
    }
    return 0;
  }

  static double speed(double value, Units units) {
    if (units.speed == 'km/h') {
      return value;
    } else if (units.speed == 'mph') {
      return (value / 1.609);
    } else if (units.speed == 'kts') {
      return (value / 1.852);
    } else if (units.speed == 'm/s') {
      return (value / 3.6);
    } else if (units.speed == 'BFT'){
      if (value.toInt()<1){
        return 0;  //calm
      } else if (value.toInt()<=5){
        return 1; //light air
      } else if (value.toInt()<=11){
        return 2; //light breeze
      } else if (value.toInt()<=19){
        return 3; //gentle breeze
      } else if (value.toInt()<=28){
        return 4; //moderate breeze
      } else if (value.toInt()<=38){
        return 5; //fresh breeze
      } else if (value.toInt()<=49){
        return 6; //strong breeze
      } else if (value.toInt()<=61){
        return 7; //near gale
      } else if (value.toInt()<=74){
        return 8; //gale
      } else if (value.toInt()<=88){
        return 9;  //strong gale
      } else if (value.toInt()<=102){
        return 10; //storm
      } else if (value.toInt()<=117){
        return 11; //violent storm
      } else if (value.toInt()>117){
        return 12; //hurricane
      }

    }
    return 0;
  }


  static double rain(double value, Units units) {
    if (units.rain == 'mm') {
      return value;
    } else if (units.rain == 'in') {
      return (value / 2.54);
    }
    return 0;
  }


  static double pressure(double value, Units units) {
    if (units.pressure == 'mbar') {
      return value;
    } else if (units.pressure == 'inHg') {
      return (value * 29.53);
    } else if (units.pressure == 'psi') {
      return (value / 68.948);
    } else if (units.pressure == 'mmHg') {
      return (value / 1.333);
    } else if (units.pressure == 'kPa') {
      return (value / 10);
    }
    return 0;
  }


  static double distance(double value, Units units) {
    if (units.distance == 'mm') {
      return value;
    } else if (units.pressure == 'in') {
      return (value / 2.54);
    }
    return 0;
  }

  static String time(DateTime value, Units units){
    if (units.time == '12h'){
      return DateFormat("h:mma").format(value);
    }
    else{
      return DateFormat("HH:mm").format(value);
    }
  }
}
