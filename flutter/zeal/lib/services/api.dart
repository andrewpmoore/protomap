
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:http/http.dart' as http;
import 'package:zeal/exceptions/api_exception.dart';
import 'package:zeal/models/content.dart';
import 'package:zeal/services/api_interface.dart';

class Api implements ApiInterface {

  static const HTTP_OK = 200;
  static const HTTP_CREATED = 201;
  static const HTTP_INTERNAL_SERVER_ERROR = 500;

  static const contentUrl = '/contents';

  var httpCall = http.Client();

  String _buildUrl(String path) {
    return "http://192.168.0.116:1337" + path;
  }

  @override
  Future<List<Content>> getContents() async {
   // Map<String, String> tokenHeader = {"Content-Type": "application/json"};

    var dio = Dio();

    final response = await dio.get(_buildUrl(contentUrl),
        options: buildCacheOptions(
          Duration(hours: 1), maxStale: Duration(days: 3650),
        )..headers = {'authorization': 'Bearer ' + '123'});

    if (response.statusCode == HTTP_OK) {
      print(response.data);
      List<Content> contents = List<Content>.from(response.data.map((x) => Content.fromJson(x)));
      print('list size ${contents.length}');
      return contents;
    } else {
      throw ApiException(response.data);
    }


  }

}