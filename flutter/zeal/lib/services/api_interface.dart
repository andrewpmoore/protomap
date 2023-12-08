import 'package:zeal/models/content.dart';

abstract class ApiInterface {
  Future<List<Content>> getContents();
}