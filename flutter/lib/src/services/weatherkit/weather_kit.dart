import 'dart:convert';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:gusty/src/services/weatherkit/constants/base_url.dart';
import 'package:gusty/src/services/weatherkit/models/current_weather_data.dart';
import 'package:gusty/src/services/weatherkit/models/data_set.dart';

class WeatherKit {
  String generateJWT({
    required String bundleId,
    required String teamId,
    required String keyId,
    required String pem,
    required Duration expiresIn,
  }) {
    final jwt = JWT(
      {
        'sub': bundleId,
      },
      issuer: teamId,
      subject: bundleId,
      header: {
        "typ": "JWT",
        'id': "$teamId.$bundleId",
        'alg': 'ES256',
        'kid': keyId,
      },
    );
    final token = jwt.sign(
      ECPrivateKey(
        pem,
      ),
      algorithm: JWTAlgorithm.ES256,
      expiresIn: expiresIn,
    );
    return token;
  }

  /// [country] should be the ISO Alpha-2 country code.
  Future<List<dynamic>> obtainAvailability({
    required String jwt,
    required double latitude,
    required double longitude,
    required String country,
  }) async {
    assert(latitude >= -90 || latitude <= 90);
    assert(latitude >= -180 || latitude <= 180);
    final response = await Dio().get("$baseUrl/availability/$latitude/$longitude?country=$country",
        options: Options(
          headers: {
            'authorization': jwt, // set content-length
          },
        ));

    return response.data;
  }

  /// Obtain weather data for the specified location.
  Future<WeatherKitModel> obtainWeatherData({
    required String jwt,
    required String language,
    required double latitude,
    required double longitude,
    required String dataSets,
    required String timezone,
    String? countryCode,
    DateTime? currentAsOf,
    DateTime? dailyEnd,
    DateTime? dailyStart,
    DateTime? hourlyEnd,
    DateTime? hourlyStart,
  }) async {
    assert(latitude >= -90 || latitude <= 90);
    assert(latitude >= -180 || latitude <= 180);
    String url =
        "$baseUrl/weather/$language/$latitude/$longitude?dataSets=$dataSets&timezone=$timezone";

    if (countryCode != null) {
      url = '$url&countryCode=$countryCode';
    }
    if (currentAsOf != null) {
      url = '$url&currentAsOf=${currentAsOf.toIso8601String()}Z';
    }
    if (dailyEnd != null) {
      url = '$url&dailyEnd=${dailyEnd.toIso8601String()}Z';
    }
    if (dailyStart != null) {
      url = '$url&dailyStart=${dailyStart.toIso8601String()}Z';
    }
    if (hourlyEnd != null) {
      url = '$url&hourlyEnd=${hourlyEnd.toIso8601String()}Z';
    }
    if (hourlyStart != null) {
      url = '$url&hourlyStart=${hourlyStart.toIso8601String()}Z';
    }

    print('jwt: $jwt');
    print('url: $url');
    final response = await Dio().get(
      url,
        options: Options(
          headers: {
            'authorization': jwt, // set content-length
          },
        )

    );
    print('url response: ${response.statusCode} ${response.data}');
    return WeatherKitModel.fromJson(response.data);
  }
}
