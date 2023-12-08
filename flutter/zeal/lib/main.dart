import 'package:flutter/material.dart';
import 'package:zeal/services/api.dart';
import 'package:zeal/services/api_interface.dart';
import 'package:zeal/services/service_locator.dart';
import 'package:zeal/ui/content_page.dart';
import 'package:zeal/ui/provider/content_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final contentProvider = ChangeNotifierProvider<ContentProvider>((ref) => new ContentProvider());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<ApiInterface>(() => Api());
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: Scaffold(backgroundColor: Colors.white, appBar: AppBar(backgroundColor: Colors.transparent, brightness: Brightness.dark, elevation: 0, title: Text("Hello", style: TextStyle(color: Colors.black)),), body: ContentPage()),
    );
  }
}
