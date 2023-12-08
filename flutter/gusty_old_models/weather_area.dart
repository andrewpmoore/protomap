// To parse this JSON data, do
//
//     final weatherArea = weatherAreaFromJson(jsonString);

import 'dart:convert';


WeatherArea weatherAreaFromJson(String str) => WeatherArea.fromJson(json.decode(str));

String weatherAreaToJson(WeatherArea data) => json.encode(data.toJson());

class WeatherArea {
  WeatherArea({
    this.location,
    this.current,
    this.forecast,
    this.alerts,
    this.name,
    this.region,
    this.country,
    this.provider,
    this.stationId,
    // this.todayObservations,
  });

  Location? location;
  Current? current;
  Forecast? forecast;
  Alerts? alerts;
  String? name;
  String? region;
  String? country;
  String? provider;
  String? stationId;
  // WundergroundTodayObservations? todayObservations;

  // bool isTodayObservationsPopulated(){
  //   if (todayObservations?.observations!=null&&todayObservations!.observations.isNotEmpty){
  //     return true;
  //   }
  //   else{
  //     return false;
  //   }
  // }

  factory WeatherArea.fromJson(Map<String, dynamic> json) => WeatherArea(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
    forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
    alerts: json["alerts"] == null ? null : Alerts.fromJson(json["alerts"]),
    name: json["name"],
    region: json["region"],
    country: json["country"],
    provider: json["provider"],
    stationId: json["stationId"],
  );

  Map<String, dynamic> toJson() => {
    "location": location == null ? null : location!.toJson(),
    "current": current == null ? null : current!.toJson(),
    "forecast": forecast == null ? null : forecast!.toJson(),
    "alerts": alerts == null ? null : alerts!.toJson(),
  };
}

class Alerts {
  Alerts({
    this.alert,
  });

  List<Alert>? alert;

  factory Alerts.fromJson(Map<String, dynamic> json) => Alerts(
    alert: json["alert"] == null ? null : List<Alert>.from(json["alert"].map((x) => Alert.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "alert": alert == null ? null : List<dynamic>.from(alert!.map((x) => x.toJson())),
  };
}

class Alert {
  Alert({
    this.headline,
    this.msgtype,
    this.severity,
    this.urgency,
    this.areas,
    this.category,
    this.certainty,
    this.event,
    this.note,
    this.effective,
    this.expires,
    this.desc,
    this.instruction,
  });

  String? headline;
  String? msgtype;
  String? severity;
  String? urgency;
  String? areas;
  String? category;
  String? certainty;
  String? event;
  String? note;
  DateTime? effective;
  DateTime? expires;
  String? desc;
  String? instruction;

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
    headline: json["headline"],
    msgtype: json["msgtype"],
    severity: json["severity"],
    urgency: json["urgency"],
    areas: json["areas"],
    category: json["category"],
    certainty: json["certainty"],
    event: json["event"],
    note: json["note"],
    effective: json["effective"] == null ? null : DateTime.parse(json["effective"]),
    expires: json["expires"] == null ? null : DateTime.parse(json["expires"]),
    desc: json["desc"],
    instruction: json["instruction"],
  );

  Map<String, dynamic> toJson() => {
    "headline": headline,
    "msgtype": msgtype,
    "severity": severity,
    "urgency": urgency,
    "areas": areas,
    "category": category,
    "certainty": certainty,
    "event": event,
    "note": note,
    "effective": effective == null ? null : effective!.toIso8601String(),
    "expires": expires == null ? null : expires!.toIso8601String(),
    "desc": desc,
    "instruction": instruction,
  };
}

class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.airQuality,
    this.solarRadiation,
    this.narrative,
  });

  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  Map<String, double>? airQuality;
  double? solarRadiation;
  String? narrative;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: json["last_updated_epoch"],
    lastUpdated: json["last_updated"],
    tempC: json["temp_c"],
    tempF: json["temp_f"],
    isDay: json["is_day"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    windMph: json["wind_mph"] == null ? null : json["wind_mph"].toDouble(),
    windKph: json["wind_kph"] == null ? null : json["wind_kph"].toDouble(),
    windDegree: json["wind_degree"],
    windDir: json["wind_dir"],
    pressureMb: json["pressure_mb"],
    pressureIn: json["pressure_in"] == null ? null : json["pressure_in"].toDouble(),
    precipMm: json["precip_mm"] == null ? null : json["precip_mm"].toDouble(),
    precipIn: json["precip_in"] == null ? null : json["precip_in"].toDouble(),
    humidity: json["humidity"] == null ? null : json["humidity"].toDouble(),
    cloud: json["cloud"] == null ? null : json["cloud"].toDouble(),
    feelslikeC: json["feelslike_c"],
    feelslikeF: json["feelslike_f"],
    visKm: json["vis_km"],
    visMiles: json["vis_miles"],
    uv: json["uv"],
    gustMph: json["gust_mph"] == null ? null : json["gust_mph"].toDouble(),
    gustKph: json["gust_kph"] == null ? null : json["gust_kph"].toDouble(),
    airQuality: json["air_quality"] == null ? null : Map.from(json["air_quality"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    solarRadiation: json["solarRadiation"],
    narrative: json["narrative"],
  );

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition == null ? null : condition!.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "vis_km": visKm,
    "vis_miles": visMiles,
    "uv": uv,
    "gust_mph": gustMph,
    "gust_kph": gustKph,
    "air_quality": airQuality == null ? null : Map.from(airQuality!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "solarRadiation": solarRadiation,
    "narrative": narrative,
  };
}

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  String? text;
  String? icon;
  int? code;

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}

class Forecast {
  Forecast({
    this.forecastday,
  });

  List<Forecastday>? forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: json["forecastday"] == null ? null : List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forecastday": forecastday == null ? null : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
  };
}

class Forecastday {
  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateEpoch: json["date_epoch"],
    day: json["day"] == null ? null : Day.fromJson(json["day"]),
    astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
    hour: json["hour"] == null ? null : List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "date_epoch": dateEpoch,
    "day": day == null ? null : day!.toJson(),
    "astro": astro == null ? null : astro!.toJson(),
    "hour": hour == null ? null : List<dynamic>.from(hour!.map((x) => x.toJson())),
  };
}

class Astro {
  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"],
    moonIllumination: json["moon_illumination"],
  );

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "moon_illumination": moonIllumination,
  };
}

class Day {
  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: json["maxtemp_c"] == null ? null : json["maxtemp_c"].toDouble(),
    maxtempF: json["maxtemp_f"] == null ? null : json["maxtemp_f"].toDouble(),
    mintempC: json["mintemp_c"] == null ? null : json["mintemp_c"].toDouble(),
    mintempF: json["mintemp_f"],
    avgtempC: json["avgtemp_c"] == null ? null : json["avgtemp_c"].toDouble(),
    avgtempF: json["avgtemp_f"] == null ? null : json["avgtemp_f"].toDouble(),
    maxwindMph: json["maxwind_mph"] == null ? null : json["maxwind_mph"].toDouble(),
    maxwindKph: json["maxwind_kph"],
    totalprecipMm: json["totalprecip_mm"],
    totalprecipIn: json["totalprecip_in"],
    avgvisKm: json["avgvis_km"],
    avgvisMiles: json["avgvis_miles"],
    avghumidity: json["avghumidity"],
    dailyWillItRain: json["daily_will_it_rain"],
    dailyChanceOfRain: json["daily_chance_of_rain"],
    dailyWillItSnow: json["daily_will_it_snow"],
    dailyChanceOfSnow: json["daily_chance_of_snow"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    uv: json["uv"],
  );

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "maxtemp_f": maxtempF,
    "mintemp_c": mintempC,
    "mintemp_f": mintempF,
    "avgtemp_c": avgtempC,
    "avgtemp_f": avgtempF,
    "maxwind_mph": maxwindMph,
    "maxwind_kph": maxwindKph,
    "totalprecip_mm": totalprecipMm,
    "totalprecip_in": totalprecipIn,
    "avgvis_km": avgvisKm,
    "avgvis_miles": avgvisMiles,
    "avghumidity": avghumidity,
    "daily_will_it_rain": dailyWillItRain,
    "daily_chance_of_rain": dailyChanceOfRain,
    "daily_will_it_snow": dailyWillItSnow,
    "daily_chance_of_snow": dailyChanceOfSnow,
    "condition": condition == null ? null : condition!.toJson(),
    "uv": uv,
  };
}

class Hour {
  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  double? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    timeEpoch: json["time_epoch"],
    time: json["time"],
    tempC: json["temp_c"] == null ? null : json["temp_c"].toDouble(),
    tempF: json["temp_f"] == null ? null : json["temp_f"].toDouble(),
    isDay: json["is_day"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    windMph: json["wind_mph"] == null ? null : json["wind_mph"].toDouble(),
    windKph: json["wind_kph"] == null ? null : json["wind_kph"].toDouble(),
    windDegree: json["wind_degree"] == null ? null : json["wind_degree"].toDouble(),
    windDir: json["wind_dir"],
    pressureMb: json["pressure_mb"],
    pressureIn: json["pressure_in"] == null ? null : json["pressure_in"].toDouble(),
    precipMm: json["precip_mm"] == null ? null : json["precip_mm"].toDouble(),
    precipIn: json["precip_in"] == null ? null : json["precip_in"].toDouble(),
    humidity: json["humidity"] == null ? null : json["humidity"].toDouble(),
    cloud: json["cloud"] == null ? null : json["cloud"].toDouble(),
    feelslikeC: json["feelslike_c"] == null ? null : json["feelslike_c"].toDouble(),
    feelslikeF: json["feelslike_f"] == null ? null : json["feelslike_f"].toDouble(),
    windchillC: json["windchill_c"] == null ? null : json["windchill_c"].toDouble(),
    windchillF: json["windchill_f"] == null ? null : json["windchill_f"].toDouble(),
    heatindexC: json["heatindex_c"] == null ? null : json["heatindex_c"].toDouble(),
    heatindexF: json["heatindex_f"] == null ? null : json["heatindex_f"].toDouble(),
    dewpointC: json["dewpoint_c"] == null ? null : json["dewpoint_c"].toDouble(),
    dewpointF: json["dewpoint_f"] == null ? null : json["dewpoint_f"].toDouble(),
    willItRain: json["will_it_rain"],
    chanceOfRain: json["chance_of_rain"],
    willItSnow: json["will_it_snow"],
    chanceOfSnow: json["chance_of_snow"],
    visKm: json["vis_km"],
    visMiles: json["vis_miles"],
    gustMph: json["gust_mph"] == null ? null : json["gust_mph"].toDouble(),
    gustKph: json["gust_kph"] == null ? null : json["gust_kph"].toDouble(),
    uv: json["uv"],
  );

  Map<String, dynamic> toJson() => {
    "time_epoch": timeEpoch,
    "time": time,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition == null ? null : condition!.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "windchill_c": windchillC,
    "windchill_f": windchillF,
    "heatindex_c": heatindexC,
    "heatindex_f": heatindexF,
    "dewpoint_c": dewpointC,
    "dewpoint_f": dewpointF,
    "will_it_rain": willItRain,
    "chance_of_rain": chanceOfRain,
    "will_it_snow": willItSnow,
    "chance_of_snow": chanceOfSnow,
    "vis_km": visKm,
    "vis_miles": visMiles,
    "gust_mph": gustMph,
    "gust_kph": gustKph,
    "uv": uv,
  };
}

class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
    tzId: json["tz_id"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}



// // To parse this JSON data, do
// //
// //     final weatherArea = weatherAreaFromJson(jsonString);
//
// // ignore_for_file: invalid_annotation_target
//
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';
//
// part 'weather_area.freezed.dart';
// part 'weather_area.g.dart';
//
// WeatherArea weatherAreaFromJson(String str) => WeatherArea.fromJson(json.decode(str));
//
// String weatherAreaToJson(WeatherArea data) => json.encode(data.toJson());
//
// @freezed
// class WeatherArea with _$WeatherArea {
//   const factory WeatherArea({
//     required Location location,
//     required Current current,
//     required Forecast forecast,
//     String? name,
//     String? region,
//     String? country,
//     Alerts? alerts,
//     // String? type,
//     String? provider,
//     @Default('xxx') String stationId,
//   }) = _WeatherArea;
//
//   factory WeatherArea.fromJson(Map<String, dynamic> json) => _$WeatherAreaFromJson(json);
// }
//
// @freezed
// class Alerts with _$Alerts {
//   const factory Alerts({
//     required List<Alert> alert,
//   }) = _Alerts;
//
//   factory Alerts.fromJson(Map<String, dynamic> json) => _$AlertsFromJson(json);
// }
//
// @freezed
// class Alert with _$Alert {
//   const factory Alert({
//     required String headline,
//     required String msgtype,
//     required String severity,
//     required String urgency,
//     required String areas,
//     required String category,
//     required String certainty,
//     required String event,
//     required String note,
//     required DateTime effective,
//     required DateTime expires,
//     required String desc,
//     required String instruction,
//   }) = _Alert;
//
//   factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
// }
//
// @freezed
// class Current with _$Current {
//   const factory Current({
//     // required int lastUpdatedEpoch,
//     // required String lastUpdated,
//     @JsonKey(name: 'temp_c') required double tempC,
//     // @JsonKey(name: 'temp_f') required double tempF,
//     @JsonKey(name: 'is_day') required int isDay,
//     required Condition condition,
//     // @JsonKey(name: 'wind_mph') required double windMph,
//     @JsonKey(name:'wind_kph') required double windKph,
//     @JsonKey(name:'wind_degree') required int windDegree,
//     // @JsonKey(name:'wind_dir') required String windDir,
//     @JsonKey(name:'pressure_mb') required double pressureMb,
//     // @JsonKey(name:'pressure_in') required double pressureIn,
//     @JsonKey(name:'precip_mm') required double precipMm,
//     // @JsonKey(name:'precip_in') required double precipIn,
//     required double humidity,
//     required double cloud,
//     @JsonKey(name:'feelslike_c') required double feelslikeC,
//     // @JsonKey(name:'feelslike_f') required double feelslikeF,
//     @JsonKey(name:'vis_km') required double visKm,
//     // @JsonKey(name:'vis_miles') required double visMiles,
//     required double uv,
//     // @JsonKey(name:'gust_mph') required double gustMph,
//     @JsonKey(name:'gust_kph') required double gustKph,
//     @JsonKey(name:'air_quality') @Default({}) Map<String, double> airQuality,
//     double? solarRadiation,
//     String? narrative,
//   }) = _Current;
//
//   factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
// }
//
// @freezed
// class Condition with _$Condition {
//   const factory Condition({
//     required String text,
//     required String icon,
//     required int code,
//   }) = _Condition;
//
//   factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);
// }
//
// @freezed
// class Forecast with _$Forecast {
//   const factory Forecast({
//     required List<Forecastday> forecastday,
//   }) = _Forecast;
//
//   factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
// }
//
// @freezed
// class Forecastday with _$Forecastday {
//   const factory Forecastday({
//     required DateTime date,
//     @JsonKey(name:'date_epoch') required int dateEpoch,
//     required Day day,
//     Astro? astro,
//     List<Hour?>? hour,
//   }) = _Forecastday;
//
//   factory Forecastday.fromJson(Map<String, dynamic> json) => _$ForecastdayFromJson(json);
// }
//
// @freezed
// class Astro with _$Astro {
//   const factory Astro({
//     required String sunrise,
//     required String sunset,
//     required String moonrise,
//     required String moonset,
//     @JsonKey(name:'moon_phase') required String moonPhase,
//     @JsonKey(name:'moon_illumination') required String moonIllumination,
//   }) = _Astro;
//
//   factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);
// }
//
// @freezed
// class Day with _$Day {
//   const factory Day({
//     @JsonKey(name:'maxtemp_c') required double maxtempC,
//     // @JsonKey(name:'maxtemp_f') required double maxtempF,
//     @JsonKey(name:'mintemp_c') required double mintempC,
//     // @JsonKey(name:'mintemp_f') required double mintempF,
//     @JsonKey(name:'avgtemp_c') double? avgtempC,
//     // @JsonKey(name:'avgtemp_f') required double avgtempF,
//     @JsonKey(name:'maxwind_mph') double? maxwindMph,
//     // @JsonKey(name:'maxwind_kph') required double maxwindKph,
//     @JsonKey(name:'totalprecip_mm') double? totalprecipMm,
//     // @JsonKey(name:'totalprecip_in') required double totalprecipIn,
//     @JsonKey(name:'avgvis_km') double? avgvisKm,
//     // @JsonKey(name:'avgvis_miles') required double avgvisMiles,
//     double? avghumidity,
//     @JsonKey(name:'daily_will_it_rain') int? dailyWillItRain,
//     @JsonKey(name:'daily_chance_of_rain') int? dailyChanceOfRain,
//     @JsonKey(name:'daily_will_it_snow') int? dailyWillItSnow,
//     @JsonKey(name:'daily_chance_of_snow') int? dailyChanceOfSnow,
//     required Condition condition,
//     double? uv,
//   }) = _Day;
//
//   factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
// }
//
// @freezed
// class Hour with _$Hour {
//   const factory Hour({
//     @JsonKey(name:'time_epoch') required int timeEpoch,
//     required String time,
//     @JsonKey(name:'temp_c') required double tempC,
//     // @JsonKey(name:'temp_f') required double tempF,
//     @JsonKey(name:'is_day') required int isDay,
//     required Condition condition,
//     // @JsonKey(name:'wind_mph') required double windMph,
//     @JsonKey(name:'wind_kph') required double windKph,
//     @JsonKey(name:'wind_degree') required int windDegree,
//     // @JsonKey(name:'wind_dir') required String windDir,
//     @JsonKey(name:'pressure_mb') required double pressureMb,
//     // @JsonKey(name:'pressure_in') required double pressureIn,
//     @JsonKey(name:'precip_mm') required double precipMm,
//     // @JsonKey(name:'precip_in') required double precipIn,
//     required int humidity,
//     required int cloud,
//     @JsonKey(name:'feelslike_c') required double feelslikeC,
//     // @JsonKey(name:'feelslike_f') required double feelslikeF,
//     @JsonKey(name:'windchill_c') required double windchillC,
//     // @JsonKey(name:'windchill_f') required double windchillF,
//     @JsonKey(name:'heatindex_c') required double heatindexC,
//     // @JsonKey(name:'heatindex_f') required double heatindexF,
//     @JsonKey(name:'dewpoint_c') required double dewpointC,
//     // @JsonKey(name:'dewpoint_f') required double dewpointF,
//     @JsonKey(name:'will_it_rain') required int willItRain,
//     @JsonKey(name:'chance_of_rain') required int chanceOfRain,
//     @JsonKey(name:'will_it_snow') required int willItSnow,
//     @JsonKey(name:'chance_of_snow') required int chanceOfSnow,
//     @JsonKey(name:'vis_km') required double visKm,
//     // @JsonKey(name:'vis_miles') required double visMiles,
//     // @JsonKey(name:'gust_mph') required double gustMph,
//     @JsonKey(name:'gust_kph') required double gustKph,
//     required double uv,
//   }) = _Hour;
//
//   factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);
// }
//
// @freezed
// class Location with _$Location {
//   const factory Location({
//     required String name,
//     required String region,
//     required String country,
//     required double lat,
//     required double lon,
//     @JsonKey(name:'tz_id') required String tzId,
//     @JsonKey(name:'localtime_epoch')required int localtimeEpoch,
//     required String localtime,
//   }) = _Location;
//
//   factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
// }
