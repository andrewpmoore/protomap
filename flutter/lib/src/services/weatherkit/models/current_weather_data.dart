class WeatherKitModel {
  WeatherKitModel({
    required this.currentWeather,
    required this.forecastDaily,
    required this.forecastHourly,
    required this.forecastNextHour,
    required this.weatherAlerts,
  });

  final CurrentWeather? currentWeather;
  final ForecastDaily? forecastDaily;
  final ForecastHourly? forecastHourly;
  final ForecastNextHour? forecastNextHour;
  final WeatherAlerts? weatherAlerts;

  factory WeatherKitModel.fromJson(Map<String, dynamic> json){
    return WeatherKitModel(
      currentWeather: json["currentWeather"] == null ? null : CurrentWeather.fromJson(json["currentWeather"]),
      forecastDaily: json["forecastDaily"] == null ? null : ForecastDaily.fromJson(json["forecastDaily"]),
      forecastHourly: json["forecastHourly"] == null ? null : ForecastHourly.fromJson(json["forecastHourly"]),
      forecastNextHour: json["forecastNextHour"] == null ? null : ForecastNextHour.fromJson(json["forecastNextHour"]),
      weatherAlerts: json["weatherAlerts"] == null ? null : WeatherAlerts.fromJson(json["weatherAlerts"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "currentWeather": currentWeather == null ? null : currentWeather!.toJson(),
      "forecastDaily": forecastDaily == null ? null : forecastDaily!.toJson(),
      "forecastHourly": forecastHourly == null ? null : forecastHourly!.toJson(),
      "forecastNextHour": forecastNextHour == null ? null : forecastNextHour!.toJson(),
      "weatherAlerts": weatherAlerts == null ? null : weatherAlerts!.toJson(),
    };
  }

  @override
  String toString(){
    return "$currentWeather, $forecastDaily, $forecastHourly, $forecastNextHour, $weatherAlerts, ";
  }
}

class CurrentWeather {
  CurrentWeather({
    required this.name,
    required this.metadata,
    required this.asOf,
    required this.cloudCover,
    required this.conditionCode,
    required this.daylight,
    required this.humidity,
    required this.precipitationIntensity,
    required this.pressure,
    required this.pressureTrend,
    required this.temperature,
    required this.temperatureApparent,
    required this.temperatureDewPoint,
    required this.uvIndex,
    required this.visibility,
    required this.windDirection,
    required this.windGust,
    required this.windSpeed,
  });

  final String name;
  final Metadata? metadata;
  final DateTime? asOf;
  final double cloudCover;
  final String conditionCode;
  final bool daylight;
  final double humidity;
  final double precipitationIntensity;
  final double pressure;
  final String pressureTrend;
  final double temperature;
  final double temperatureApparent;
  final double temperatureDewPoint;
  final int uvIndex;
  final double visibility;
  final int windDirection;
  final double windGust;
  final double windSpeed;

  factory CurrentWeather.fromJson(Map<String, dynamic> json){
    return CurrentWeather(
      name: json["name"] ?? "",
      metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      asOf: json["asOf"] == null ? null : DateTime.parse(json["asOf"]),
      cloudCover: json["cloudCover"] ?? 0.0,
      conditionCode: json["conditionCode"] ?? "",
      daylight: json["daylight"] ?? false,
      humidity: json["humidity"] ?? 0.0,
      precipitationIntensity: json["precipitationIntensity"] ?? 0,
      pressure: json["pressure"] ?? 0.0,
      pressureTrend: json["pressureTrend"] ?? "",
      temperature: json["temperature"] ?? 0.0,
      temperatureApparent: json["temperatureApparent"] ?? 0.0,
      temperatureDewPoint: json["temperatureDewPoint"] ?? 0.0,
      uvIndex: json["uvIndex"] ?? 0,
      visibility: json["visibility"] ?? 0.0,
      windDirection: json["windDirection"] ?? 0,
      windGust: json["windGust"] ?? 0.0,
      windSpeed: json["windSpeed"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "metadata": metadata == null ? null : metadata!.toJson(),
      "asOf": asOf == null ? null : asOf!.toIso8601String(),
      "cloudCover": cloudCover,
      "conditionCode": conditionCode,
      "daylight": daylight,
      "humidity": humidity,
      "precipitationIntensity": precipitationIntensity,
      "pressure": pressure,
      "pressureTrend": pressureTrend,
      "temperature": temperature,
      "temperatureApparent": temperatureApparent,
      "temperatureDewPoint": temperatureDewPoint,
      "uvIndex": uvIndex,
      "visibility": visibility,
      "windDirection": windDirection,
      "windGust": windGust,
      "windSpeed": windSpeed,
    };
  }


  @override
  String toString(){
    return "$name, $metadata, $asOf, $cloudCover, $conditionCode, $daylight, $humidity, $precipitationIntensity, $pressure, $pressureTrend, $temperature, $temperatureApparent, $temperatureDewPoint, $uvIndex, $visibility, $windDirection, $windGust, $windSpeed, ";
  }
}

class Metadata {
  Metadata({
    required this.attributionUrl,
    required this.expireTime,
    required this.latitude,
    required this.longitude,
    required this.readTime,
    required this.reportedTime,
    required this.units,
    required this.version,
    required this.language,
    required this.providerName,
  });

  final String attributionUrl;
  final DateTime? expireTime;
  final double latitude;
  final double longitude;
  final DateTime? readTime;
  final DateTime? reportedTime;
  final String units;
  final int version;
  final String language;
  final String providerName;

  factory Metadata.fromJson(Map<String, dynamic> json){
    return Metadata(
      attributionUrl: json["attributionURL"] ?? "",
      expireTime: json["expireTime"] == null ? null : DateTime.parse(json["expireTime"]),
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0,
      readTime: json["readTime"] == null ? null : DateTime.parse(json["readTime"]),
      reportedTime: json["reportedTime"] == null ? null : DateTime.parse(json["reportedTime"]),
      units: json["units"] ?? "",
      version: json["version"] ?? 0,
      language: json["language"] ?? "",
      providerName: json["providerName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "attributionURL": attributionUrl,
      "expireTime": expireTime == null ? null : expireTime!.toIso8601String(),
      "latitude": latitude,
      "longitude": longitude,
      "readTime": readTime == null ? null : readTime!.toIso8601String(),
      "reportedTime": reportedTime == null ? null : reportedTime!.toIso8601String(),
      "units": units,
      "version": version,
      "language": language,
      "providerName": providerName,
    };
  }

  @override
  String toString(){
    return "$attributionUrl, $expireTime, $latitude, $longitude, $readTime, $reportedTime, $units, $version, $language, $providerName, ";
  }
}

class ForecastDaily {
  ForecastDaily({
    required this.name,
    required this.metadata,
    required this.days,
  });

  final String name;
  final Metadata? metadata;
  final List<Day> days;

  factory ForecastDaily.fromJson(Map<String, dynamic> json){
    return ForecastDaily(
      name: json["name"] ?? "",
      metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      days: json["days"] == null ? [] : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "metadata": metadata == null ? null : metadata!.toJson(),
      "days": days == null ? [] : days.map((x) => x.toJson()).toList(),
    };
  }

  @override
  String toString(){
    return "$name, $metadata, $days, ";
  }
}

class Day {
  Day({
    required this.forecastStart,
    required this.forecastEnd,
    required this.conditionCode,
    required this.maxUvIndex,
    required this.moonPhase,
    required this.moonrise,
    required this.moonset,
    required this.precipitationAmount,
    required this.precipitationChance,
    required this.precipitationType,
    required this.snowfallAmount,
    required this.solarMidnight,
    required this.solarNoon,
    required this.sunrise,
    required this.sunriseCivil,
    required this.sunriseNautical,
    required this.sunriseAstronomical,
    required this.sunset,
    required this.sunsetCivil,
    required this.sunsetNautical,
    required this.sunsetAstronomical,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.daytimeForecast,
    required this.overnightForecast,
    required this.restOfDayForecast,
  });

  final DateTime? forecastStart;
  final DateTime? forecastEnd;
  final String conditionCode;
  final int maxUvIndex;
  final String moonPhase;
  final DateTime? moonrise;
  final DateTime? moonset;
  final double precipitationAmount;
  final double precipitationChance;
  final String precipitationType;
  final double snowfallAmount;
  final DateTime? solarMidnight;
  final DateTime? solarNoon;
  final DateTime? sunrise;
  final DateTime? sunriseCivil;
  final DateTime? sunriseNautical;
  final DateTime? sunriseAstronomical;
  final DateTime? sunset;
  final DateTime? sunsetCivil;
  final DateTime? sunsetNautical;
  final DateTime? sunsetAstronomical;
  final double temperatureMax;
  final double temperatureMin;
  final Forecast? daytimeForecast;
  final Forecast? overnightForecast;
  final Forecast? restOfDayForecast;

  factory Day.fromJson(Map<String, dynamic> json){
    return Day(
      forecastStart: json["forecastStart"] == null ? null : DateTime.parse(json["forecastStart"]),
      forecastEnd: json["forecastEnd"] == null ? null : DateTime.parse(json["forecastEnd"]),
      conditionCode: json["conditionCode"] ?? "",
      maxUvIndex: json["maxUvIndex"] ?? 0,
      moonPhase: json["moonPhase"] ?? "",
      moonrise: json["moonrise"] == null ? null : DateTime.parse(json["moonrise"]),
      moonset: json["moonset"] == null ? null : DateTime.parse(json["moonset"]),
      precipitationAmount: json["precipitationAmount"] ?? 0.0,
      precipitationChance: json["precipitationChance"] ?? 0.0,
      precipitationType: json["precipitationType"] ?? "",
      snowfallAmount: json["snowfallAmount"] ?? 0,
      solarMidnight: json["solarMidnight"] == null ? null : DateTime.parse(json["solarMidnight"]),
      solarNoon: json["solarNoon"] == null ? null : DateTime.parse(json["solarNoon"]),
      sunrise: json["sunrise"] == null ? null : DateTime.parse(json["sunrise"]),
      sunriseCivil: json["sunriseCivil"] == null ? null : DateTime.parse(json["sunriseCivil"]),
      sunriseNautical: json["sunriseNautical"] == null ? null : DateTime.parse(json["sunriseNautical"]),
      sunriseAstronomical: json["sunriseAstronomical"] == null ? null : DateTime.parse(json["sunriseAstronomical"]),
      sunset: json["sunset"] == null ? null : DateTime.parse(json["sunset"]),
      sunsetCivil: json["sunsetCivil"] == null ? null : DateTime.parse(json["sunsetCivil"]),
      sunsetNautical: json["sunsetNautical"] == null ? null : DateTime.parse(json["sunsetNautical"]),
      sunsetAstronomical: json["sunsetAstronomical"] == null ? null : DateTime.parse(json["sunsetAstronomical"]),
      temperatureMax: json["temperatureMax"] ?? 0.0,
      temperatureMin: json["temperatureMin"] ?? 0.0,
      daytimeForecast: json["daytimeForecast"] == null ? null : Forecast.fromJson(json["daytimeForecast"]),
      overnightForecast: json["overnightForecast"] == null ? null : Forecast.fromJson(json["overnightForecast"]),
      restOfDayForecast: json["restOfDayForecast"] == null ? null : Forecast.fromJson(json["restOfDayForecast"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "forecastStart": forecastStart == null ? null : forecastStart!.toIso8601String(),
      "forecastEnd": forecastEnd == null ? null : forecastEnd!.toIso8601String(),
      "conditionCode": conditionCode,
      "maxUvIndex": maxUvIndex,
      "moonPhase": moonPhase,
      "moonrise": moonrise == null ? null : moonrise!.toIso8601String(),
      "moonset": moonset == null ? null : moonset!.toIso8601String(),
      "precipitationAmount": precipitationAmount,
      "precipitationChance": precipitationChance,
      "precipitationType": precipitationType,
      "snowfallAmount": snowfallAmount,
      "solarMidnight": solarMidnight == null ? null : solarMidnight!.toIso8601String(),
      "solarNoon": solarNoon == null ? null : solarNoon!.toIso8601String(),
      "sunrise": sunrise == null ? null : sunrise!.toIso8601String(),
      "sunriseCivil": sunriseCivil == null ? null : sunriseCivil!.toIso8601String(),
      "sunriseNautical": sunriseNautical == null ? null : sunriseNautical!.toIso8601String(),
      "sunriseAstronomical": sunriseAstronomical == null ? null : sunriseAstronomical!.toIso8601String(),
      "sunset": sunset == null ? null : sunset!.toIso8601String(),
      "sunsetCivil": sunsetCivil == null ? null : sunsetCivil!.toIso8601String(),
      "sunsetNautical": sunsetNautical == null ? null : sunsetNautical!.toIso8601String(),
      "sunsetAstronomical": sunsetAstronomical == null ? null : sunsetAstronomical!.toIso8601String(),
      "temperatureMax": temperatureMax,
      "temperatureMin": temperatureMin,
      "daytimeForecast": daytimeForecast == null ? null : daytimeForecast!.toJson(),
      "overnightForecast": overnightForecast == null ? null : overnightForecast!.toJson(),
      "restOfDayForecast": restOfDayForecast == null ? null : restOfDayForecast!.toJson(),
    };
  }


  @override
  String toString(){
    return "$forecastStart, $forecastEnd, $conditionCode, $maxUvIndex, $moonPhase, $moonrise, $moonset, $precipitationAmount, $precipitationChance, $precipitationType, $snowfallAmount, $solarMidnight, $solarNoon, $sunrise, $sunriseCivil, $sunriseNautical, $sunriseAstronomical, $sunset, $sunsetCivil, $sunsetNautical, $sunsetAstronomical, $temperatureMax, $temperatureMin, $daytimeForecast, $overnightForecast, $restOfDayForecast, ";
  }
}

class Forecast {
  Forecast({
    required this.forecastStart,
    required this.forecastEnd,
    required this.cloudCover,
    required this.conditionCode,
    required this.humidity,
    required this.precipitationAmount,
    required this.precipitationChance,
    required this.precipitationType,
    required this.snowfallAmount,
    required this.windDirection,
    required this.windSpeed,
  });

  final DateTime? forecastStart;
  final DateTime? forecastEnd;
  final double cloudCover;
  final String conditionCode;
  final double humidity;
  final double precipitationAmount;
  final double precipitationChance;
  final String precipitationType;
  final double snowfallAmount;
  final int windDirection;
  final double windSpeed;

  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(
      forecastStart: json["forecastStart"] == null ? null : DateTime.parse(json["forecastStart"]),
      forecastEnd: json["forecastEnd"] == null ? null : DateTime.parse(json["forecastEnd"]),
      cloudCover: json["cloudCover"] ?? 0.0,
      conditionCode: json["conditionCode"] ?? "",
      humidity: json["humidity"] ?? 0.0,
      precipitationAmount: json["precipitationAmount"] ?? 0.0,
      precipitationChance: json["precipitationChance"] ?? 0.0,
      precipitationType: json["precipitationType"] ?? "",
      snowfallAmount: json["snowfallAmount"] ?? 0.0,
      windDirection: json["windDirection"] ?? 0,
      windSpeed: json["windSpeed"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "forecastStart": forecastStart == null ? null : forecastStart!.toIso8601String(),
      "forecastEnd": forecastEnd == null ? null : forecastEnd!.toIso8601String(),
      "cloudCover": cloudCover,
      "conditionCode": conditionCode,
      "humidity": humidity,
      "precipitationAmount": precipitationAmount,
      "precipitationChance": precipitationChance,
      "precipitationType": precipitationType,
      "snowfallAmount": snowfallAmount,
      "windDirection": windDirection,
      "windSpeed": windSpeed,
    };
  }


  @override
  String toString(){
    return "$forecastStart, $forecastEnd, $cloudCover, $conditionCode, $humidity, $precipitationAmount, $precipitationChance, $precipitationType, $snowfallAmount, $windDirection, $windSpeed, ";
  }
}

class ForecastHourly {
  ForecastHourly({
    required this.name,
    required this.metadata,
    required this.hours,
  });

  final String name;
  final Metadata? metadata;
  final List<Hour> hours;

  factory ForecastHourly.fromJson(Map<String, dynamic> json){
    return ForecastHourly(
      name: json["name"] ?? "",
      metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      hours: json["hours"] == null ? [] : List<Hour>.from(json["hours"]!.map((x) => Hour.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "metadata": metadata == null ? null : metadata!.toJson(),
      "hours": hours == null ? [] : hours.map((x) => x.toJson()).toList(),
    };
  }


  @override
  String toString(){
    return "$name, $metadata, $hours, ";
  }
}

class Hour {
  Hour({
    required this.forecastStart,
    required this.cloudCover,
    required this.conditionCode,
    required this.daylight,
    required this.humidity,
    required this.precipitationAmount,
    required this.precipitationIntensity,
    required this.precipitationChance,
    required this.precipitationType,
    required this.pressure,
    required this.pressureTrend,
    required this.snowfallIntensity,
    required this.snowfallAmount,
    required this.temperature,
    required this.temperatureApparent,
    required this.temperatureDewPoint,
    required this.uvIndex,
    required this.visibility,
    required this.windDirection,
    required this.windGust,
    required this.windSpeed,
  });

  final DateTime? forecastStart;
  final double cloudCover;
  final String conditionCode;
  final bool daylight;
  final double humidity;
  final double precipitationAmount;
  final double precipitationIntensity;
  final double precipitationChance;
  final String precipitationType;
  final double pressure;
  final String pressureTrend;
  final double snowfallIntensity;
  final double snowfallAmount;
  final double temperature;
  final double temperatureApparent;
  final double temperatureDewPoint;
  final int uvIndex;
  final double visibility;
  final int windDirection;
  final double windGust;
  final double windSpeed;

  factory Hour.fromJson(Map<String, dynamic> json){
    return Hour(
      forecastStart: json["forecastStart"] == null ? null : DateTime.parse(json["forecastStart"]),
      cloudCover: json["cloudCover"] ?? 0.0,
      conditionCode: json["conditionCode"] ?? "",
      daylight: json["daylight"] ?? false,
      humidity: json["humidity"] ?? 0.0,
      precipitationAmount: json["precipitationAmount"] ?? 0.0,
      precipitationIntensity: json["precipitationIntensity"] ?? 0.0,
      precipitationChance: json["precipitationChance"] ?? 0.0,
      precipitationType: json["precipitationType"] ?? "",
      pressure: json["pressure"] ?? 0.0,
      pressureTrend: json["pressureTrend"] ?? "",
      snowfallIntensity: json["snowfallIntensity"] ?? 0.0,
      snowfallAmount: json["snowfallAmount"] ?? 0.0,
      temperature: json["temperature"] ?? 0.0,
      temperatureApparent: json["temperatureApparent"] ?? 0.0,
      temperatureDewPoint: json["temperatureDewPoint"] ?? 0.0,
      uvIndex: json["uvIndex"] ?? 0,
      visibility: json["visibility"] ?? 0.0,
      windDirection: json["windDirection"] ?? 0,
      windGust: json["windGust"] ?? 0.0,
      windSpeed: json["windSpeed"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "forecastStart": forecastStart == null ? null : forecastStart!.toIso8601String(),
      "cloudCover": cloudCover,
      "conditionCode": conditionCode,
      "daylight": daylight,
      "humidity": humidity,
      "precipitationAmount": precipitationAmount,
      "precipitationIntensity": precipitationIntensity,
      "precipitationChance": precipitationChance,
      "precipitationType": precipitationType,
      "pressure": pressure,
      "pressureTrend": pressureTrend,
      "snowfallIntensity": snowfallIntensity,
      "snowfallAmount": snowfallAmount,
      "temperature": temperature,
      "temperatureApparent": temperatureApparent,
      "temperatureDewPoint": temperatureDewPoint,
      "uvIndex": uvIndex,
      "visibility": visibility,
      "windDirection": windDirection,
      "windGust": windGust,
      "windSpeed": windSpeed,
    };
  }


  @override
  String toString(){
    return "$forecastStart, $cloudCover, $conditionCode, $daylight, $humidity, $precipitationAmount, $precipitationIntensity, $precipitationChance, $precipitationType, $pressure, $pressureTrend, $snowfallIntensity, $snowfallAmount, $temperature, $temperatureApparent, $temperatureDewPoint, $uvIndex, $visibility, $windDirection, $windGust, $windSpeed, ";
  }
}

class ForecastNextHour {
  ForecastNextHour({
    required this.name,
    required this.metadata,
    required this.summary,
    required this.forecastStart,
    required this.forecastEnd,
    required this.minutes,
  });

  final String name;
  final Metadata? metadata;
  final List<Minute> summary;
  final DateTime? forecastStart;
  final DateTime? forecastEnd;
  final List<Minute> minutes;

  factory ForecastNextHour.fromJson(Map<String, dynamic> json){
    return ForecastNextHour(
      name: json["name"] ?? "",
      metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      summary: json["summary"] == null ? [] : List<Minute>.from(json["summary"]!.map((x) => Minute.fromJson(x))),
      forecastStart: json["forecastStart"] == null ? null : DateTime.parse(json["forecastStart"]),
      forecastEnd: json["forecastEnd"] == null ? null : DateTime.parse(json["forecastEnd"]),
      minutes: json["minutes"] == null ? [] : List<Minute>.from(json["minutes"]!.map((x) => Minute.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "metadata": metadata == null ? null : metadata!.toJson(),
      "summary": summary == null ? [] : summary.map((x) => x.toJson()).toList(),
      "forecastStart": forecastStart == null ? null : forecastStart!.toIso8601String(),
      "forecastEnd": forecastEnd == null ? null : forecastEnd!.toIso8601String(),
      "minutes": minutes == null ? [] : minutes.map((x) => x.toJson()).toList(),
    };
  }


  @override
  String toString(){
    return "$name, $metadata, $summary, $forecastStart, $forecastEnd, $minutes, ";
  }
}

class Minute {
  Minute({
    required this.startTime,
    required this.precipitationChance,
    required this.precipitationIntensity,
    required this.condition,
  });

  final DateTime? startTime;
  final double precipitationChance;
  final double precipitationIntensity;
  final String condition;

  factory Minute.fromJson(Map<String, dynamic> json){
    return Minute(
      startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
      precipitationChance: json["precipitationChance"] ?? 0,
      precipitationIntensity: json["precipitationIntensity"] ?? 0,
      condition: json["condition"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "startTime": startTime == null ? null : startTime!.toIso8601String(),
      "precipitationChance": precipitationChance,
      "precipitationIntensity": precipitationIntensity,
      "condition": condition,
    };
  }


  @override
  String toString(){
    return "$startTime, $precipitationChance, $precipitationIntensity, $condition, ";
  }
}

class WeatherAlerts {
  WeatherAlerts({
    required this.name,
    required this.metadata,
    required this.detailsUrl,
    required this.alerts,
  });

  final String name;
  final Metadata? metadata;
  final String detailsUrl;
  final List<Alert> alerts;

  factory WeatherAlerts.fromJson(Map<String, dynamic> json){
    return WeatherAlerts(
      name: json["name"] ?? "",
      metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      detailsUrl: json["detailsUrl"] ?? "",
      alerts: json["alerts"] == null ? [] : List<Alert>.from(json["alerts"]!.map((x) => Alert.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "metadata": metadata == null ? null : metadata!.toJson(),
      "detailsUrl": detailsUrl,
      "alerts": alerts == null ? [] : alerts.map((x) => x.toJson()).toList(),
    };
  }


  @override
  String toString(){
    return "$name, $metadata, $detailsUrl, $alerts, ";
  }
}

class Alert {
  Alert({
    required this.name,
    required this.id,
    required this.areaId,
    required this.areaName,
    required this.attributionUrl,
    required this.countryCode,
    required this.description,
    required this.effectiveTime,
    required this.expireTime,
    required this.issuedTime,
    required this.eventOnsetTime,
    required this.detailsUrl,
    required this.phenomenon,
    required this.precedence,
    required this.severity,
    required this.source,
    required this.eventSource,
    required this.urgency,
    required this.certainty,
    required this.importance,
    required this.responses,
  });

  final String name;
  final String id;
  final String areaId;
  final String areaName;
  final String attributionUrl;
  final String countryCode;
  final String description;
  final DateTime? effectiveTime;
  final DateTime? expireTime;
  final DateTime? issuedTime;
  final DateTime? eventOnsetTime;
  final String detailsUrl;
  final String phenomenon;
  final int precedence;
  final String severity;
  final String source;
  final String eventSource;
  final String urgency;
  final String certainty;
  final String importance;
  final List<String> responses;

  factory Alert.fromJson(Map<String, dynamic> json){
    return Alert(
      name: json["name"] ?? "",
      id: json["id"] ?? "",
      areaId: json["areaId"] ?? "",
      areaName: json["areaName"] ?? "",
      attributionUrl: json["attributionURL"] ?? "",
      countryCode: json["countryCode"] ?? "",
      description: json["description"] ?? "",
      effectiveTime: json["effectiveTime"] == null ? null : DateTime.parse(json["effectiveTime"]),
      expireTime: json["expireTime"] == null ? null : DateTime.parse(json["expireTime"]),
      issuedTime: json["issuedTime"] == null ? null : DateTime.parse(json["issuedTime"]),
      eventOnsetTime: json["eventOnsetTime"] == null ? null : DateTime.parse(json["eventOnsetTime"]),
      detailsUrl: json["detailsUrl"] ?? "",
      phenomenon: json["phenomenon"] ?? "",
      precedence: json["precedence"] ?? 0,
      severity: json["severity"] ?? "",
      source: json["source"] ?? "",
      eventSource: json["eventSource"] ?? "",
      urgency: json["urgency"] ?? "",
      certainty: json["certainty"] ?? "",
      importance: json["importance"] ?? "",
      responses: json["responses"] == null ? [] : List<String>.from(json["responses"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "areaId": areaId,
      "areaName": areaName,
      "attributionURL": attributionUrl,
      "countryCode": countryCode,
      "description": description,
      "effectiveTime": effectiveTime == null ? null : effectiveTime!.toIso8601String(),
      "expireTime": expireTime == null ? null : expireTime!.toIso8601String(),
      "issuedTime": issuedTime == null ? null : issuedTime!.toIso8601String(),
      "eventOnsetTime": eventOnsetTime == null ? null : eventOnsetTime!.toIso8601String(),
      "detailsUrl": detailsUrl,
      "phenomenon": phenomenon,
      "precedence": precedence,
      "severity": severity,
      "source": source,
      "eventSource": eventSource,
      "urgency": urgency,
      "certainty": certainty,
      "importance": importance,
      "responses": responses,
    };
  }


  @override
  String toString(){
    return "$name, $id, $areaId, $areaName, $attributionUrl, $countryCode, $description, $effectiveTime, $expireTime, $issuedTime, $eventOnsetTime, $detailsUrl, $phenomenon, $precedence, $severity, $source, $eventSource, $urgency, $certainty, $importance, $responses, ";
  }
}
