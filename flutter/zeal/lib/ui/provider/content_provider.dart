import 'package:flutter/material.dart';
import 'package:zeal/models/content.dart';
import 'package:zeal/services/api_interface.dart';
import 'package:zeal/services/service_locator.dart';



class ContentProvider extends ChangeNotifier {


  List<Content> get contentList => _contentList;

  set contentList(List<Content> value) {
    _contentList = value;
    notifyListeners();
  }

  List<Content> _contentList = [];

  ContentProvider(){
    _init();
  }



  void _init() async{
    // final isar = await openIsar();

    var _api = getIt<ApiInterface>();
    contentList = await _api.getContents();
  }


}