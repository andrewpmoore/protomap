import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/common/weather_update.dart';
import 'package:gusty/src/env/env.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/services/database/database.dart';
import 'package:gusty/src/services/weatherkit/models/current_weather_data.dart';
import 'package:gusty/src/services/weatherkit/models/data_set.dart';
import 'package:gusty/src/services/weatherkit/weather_kit.dart';
import 'package:gusty/src/ui/home.dart';
import 'package:gusty/src/ui/set_units.dart';
import 'package:gusty/src/ui/set_wunderground_api_key.dart';
import 'package:gusty/src/ui/weather_details.dart';
import 'package:home_widget/home_widget.dart';



const Color standardTextLight = Color(0xFF001F2A);
// const Color standardLabelLight = Color(0xff7B94A7);

const Color standardTextDark = Color(0xFFBFE9FF);
// const Color standardLabelDark = Color(0xff7B94A7);

// const Color standardLabel = Color(0xFFBFE9FF);



// const Color colorLevel1 = Color(0xff9cff9c);
// const Color colorLevel2 = Color(0xff31ff00);
// const Color colorLevel3 = Color(0xff31cf00);
// const Color colorLevel4 = Color(0xffffff00);
// const Color colorLevel5 = Color(0xffff9a00);
// const Color colorLevel6 = Color(0xffff9a00);
// const Color colorLevel7 = Color(0xffff6464);
// const Color colorLevel8 = Color(0xffff0000);
// const Color colorLevel9 = Color(0xff990000);
// const Color colorLevel10 = Color(0xffce30ff);

const Color colorLevel1 = Color(0xff00a77a);
const Color colorLevel2 = Color(0xff55BA67);
const Color colorLevel3 = Color(0xffAACE54);
const Color colorLevel4 = Color(0xffffe141);
const Color colorLevel5 = Color(0xffFFC541);
const Color colorLevel6 = Color(0xffffa941);
const Color colorLevel7 = Color(0xffEC6542);
const Color colorLevel8 = Color(0xffd82042);
const Color colorLevel9 = Color(0xffbf0d9e);
const Color colorLevel10 = Color(0xff6618ba);




TextTheme textThemeLight = TextTheme(
  displayLarge: TextStyle(debugLabel: 'workSans displayLarge', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextLight, decoration: TextDecoration.none, letterSpacing: -5, fontSize: 72),
  displayMedium: TextStyle(debugLabel: 'workSans displayMedium', fontFamily: GoogleFonts.inter().fontFamily,  color: standardTextLight, decoration: TextDecoration.none,),
  displaySmall: TextStyle(debugLabel: 'workSans displaySmall', fontFamily: GoogleFonts.inter().fontFamily,  color: standardTextLight, decoration: TextDecoration.none,),
  headlineLarge: TextStyle(debugLabel: 'workSans headlineLarge', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextLight,  decoration: TextDecoration.none, letterSpacing: -2),
  headlineMedium: TextStyle(debugLabel: 'workSans headlineMedium', fontFamily: GoogleFonts.inter().fontFamily,  color: standardTextLight, decoration: TextDecoration.none,),
  headlineSmall: TextStyle(debugLabel: 'workSans headlineSmall', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextLight,  decoration: TextDecoration.none,),
  titleLarge: TextStyle(debugLabel: 'workSans titleLarge', fontFamily: GoogleFonts.inter().fontFamily, fontWeight: FontWeight.w600, color: standardTextLight, decoration: TextDecoration.none,),
  titleMedium: TextStyle(debugLabel: 'workSans titleMedium', fontFamily: GoogleFonts.inter().fontFamily, fontWeight: FontWeight.w600,color: standardTextLight,  decoration: TextDecoration.none, ),
  titleSmall: TextStyle(debugLabel: 'workSans titleSmall', fontFamily: GoogleFonts.inter().fontFamily, fontWeight: FontWeight.w500,color: standardTextLight,  decoration: TextDecoration.none, ),
  bodyLarge: TextStyle(debugLabel: 'workSans bodyLarge', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextLight,  decoration: TextDecoration.none,),
  bodyMedium: TextStyle(debugLabel: 'workSans bodyMedium', fontFamily: GoogleFonts.inter().fontFamily,color: standardTextLight,   decoration: TextDecoration.none,),
  bodySmall: TextStyle(debugLabel: 'workSans bodySmall', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextLight,  decoration: TextDecoration.none,),
  labelLarge: TextStyle(debugLabel: 'workSans labelLarge', fontFamily: GoogleFonts.inter().fontFamily,  color: standardTextLight, decoration: TextDecoration.none,),
  labelMedium: TextStyle(debugLabel: 'workSans labelMedium', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextLight,  decoration: TextDecoration.none,),
  labelSmall: TextStyle(debugLabel: 'workSans labelSmall', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextLight,  decoration: TextDecoration.none,letterSpacing: -0.3),
);

TextTheme textThemeDark = TextTheme(
  displayLarge: TextStyle(debugLabel: 'workSans displayLarge', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark, decoration: TextDecoration.none, letterSpacing: -5, fontSize: 72),
  displayMedium: TextStyle(debugLabel: 'workSans displayMedium', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark,decoration: TextDecoration.none,),
  displaySmall: TextStyle(debugLabel: 'workSans displaySmall', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark,decoration: TextDecoration.none,),
  headlineLarge: TextStyle(debugLabel: 'workSans headlineLarge', fontFamily: GoogleFonts.inter().fontFamily,color: standardTextDark, decoration: TextDecoration.none, letterSpacing: -2),
  headlineMedium: TextStyle(debugLabel: 'workSans headlineMedium', fontFamily: GoogleFonts.inter().fontFamily,color: standardTextDark, decoration: TextDecoration.none,),
  headlineSmall: TextStyle(debugLabel: 'workSans headlineSmall', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  titleLarge: TextStyle(debugLabel: 'workSans titleLarge', fontFamily: GoogleFonts.inter().fontFamily,  fontWeight: FontWeight.w600, color: standardTextDark,decoration: TextDecoration.none,),
  titleMedium: TextStyle(debugLabel: 'workSans titleMedium', fontFamily: GoogleFonts.inter().fontFamily, fontWeight: FontWeight.w600, color: standardTextDark, decoration: TextDecoration.none, ),
  titleSmall: TextStyle(debugLabel: 'workSans titleSmall', fontFamily: GoogleFonts.inter().fontFamily, fontWeight: FontWeight.w500, color: standardTextDark, decoration: TextDecoration.none, ),
  bodyLarge: TextStyle(debugLabel: 'workSans bodyLarge', fontFamily: GoogleFonts.inter().fontFamily,  color: standardTextDark,decoration: TextDecoration.none,),
  bodyMedium: TextStyle(debugLabel: 'workSans bodyMedium', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  bodySmall: TextStyle(debugLabel: 'workSans bodySmall', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  labelLarge: TextStyle(debugLabel: 'workSans labelLarge', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  labelMedium: TextStyle(debugLabel: 'workSans labelMedium', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  labelSmall: TextStyle(debugLabel: 'workSans labelSmall', fontFamily: GoogleFonts.inter().fontFamily, color: standardTextDark, decoration: TextDecoration.none,letterSpacing: -0.3),
);


const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF2F51D5),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDDE1FF),
  onPrimaryContainer: Color(0xFF001356),
  secondary: Color(0xFFB90063),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFD9E2),
  onSecondaryContainer: Color(0xFF3E001D),
  tertiary: Color(0xFF6E4DA1),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFECDCFF),
  onTertiaryContainer: Color(0xFF280057),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFCFF),
  onBackground: Color(0xFF001F2A),
  surface: Color(0xFFFAFCFF),
  onSurface: Color(0xFF001F2A),
  surfaceVariant: Color(0xFFE2E1EC),
  onSurfaceVariant: Color(0xFF45464F),
  outline: Color(0xFF767680),
  onInverseSurface: Color(0xFFE1F4FF),
  inverseSurface: Color(0xFF003547),
  inversePrimary: Color(0xFFB9C3FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF2F51D5),
  // outlineVariant: Color(0xFFC6C5D0),
  // scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB9C3FF),
  onPrimary: Color(0xFF002389),
  primaryContainer: Color(0xFF0435BD),
  onPrimaryContainer: Color(0xFFDDE1FF),
  secondary: Color(0xFFFFB1C8),
  onSecondary: Color(0xFF650033),
  secondaryContainer: Color(0xFF8E004A),
  onSecondaryContainer: Color(0xFFFFD9E2),
  tertiary: Color(0xFFD6BAFF),
  onTertiary: Color(0xFF3E1C6F),
  tertiaryContainer: Color(0xFF553587),
  onTertiaryContainer: Color(0xFFECDCFF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F2A),
  onBackground: Color(0xFFBFE9FF),
  surface: Color(0xFF173342),
  onSurface: Color(0xFFBFE9FF),
  surfaceVariant: Color(0xFF45464F),
  onSurfaceVariant: Color(0xFFC6C5D0),
  outline: Color(0xFF90909A),
  onInverseSurface: Color(0xFF001F2A),
  inverseSurface: Color(0xFFBFE9FF),
  inversePrimary: Color(0xFF2F51D5),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB9C3FF),
  // outlineVariant: Color(0xFF45464F),
  // scrim: Color(0xFF000000),
);


/// The Widget that configures your application.
class GustyApp extends ConsumerStatefulWidget  {
  const GustyApp({Key? key}) : super(key: key);

  @override
  GustyAppState createState() => GustyAppState();
}

class GustyAppState extends ConsumerState<GustyApp> with WidgetsBindingObserver{
  bool _hasSettingsLoaded = false;

  late Timer timer;



  @override
  void initState() {

    super.initState();
    ref.read(settingsProvider).loadSettings().then((_) {
      setState(() => _hasSettingsLoaded = true);
    });
    WidgetsBinding.instance.addObserver(this);

    // ref.read(weatherProvider).init();
    getInitialWeather();

    timer = Timer.periodic(const Duration(minutes: 1), (Timer t) {
      print('timer triggered here');
      monitorWeatherSources();
    });

    initPlatformState();
  }

  Future<void> getInitialWeather() async{
    await monitorWeatherSources();
  }

  Future<void> initPlatformState() async {
    //BACKGROUND FETCH CODE
    // Configure BackgroundFetch.
    // int status = await BackgroundFetch.configure(BackgroundFetchConfig(
    //     minimumFetchInterval: 15,
    //     forceAlarmManager: false,
    //     stopOnTerminate: false,
    //     enableHeadless: true,
    //     requiresBatteryNotLow: false,
    //     requiresCharging: false,
    //     requiresStorageNotLow: false,
    //     requiresDeviceIdle: false,
    //     requiredNetworkType: NetworkType.ANY
    // ), onBackgroundFetch, onBackgroundFetchTimeout);
    //
    // print('[BackgroundFetch] configure success: $status');
    //
    //
    // bool status2 = await BackgroundFetch.scheduleTask(TaskConfig(
    //     taskId: 'com.transistorsoft.gusty.update',
    //     delay: 15 * 60 * 1000,  //  In 15 mins (milliseconds) ,
    //   periodic: true,
    //
    // ));
    // print('[BackgroundFetch] configure success2: $status2');



    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('refresh triggered');
    monitorWeatherSources();
  }

  @override
  void dispose() {
    timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }





  final GoRouter _router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    redirect: (state){
      return null;  //want them to go to where they should
    },
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const Home(),
        routes: [
          GoRoute(
            name: 'weather-details',
            path: 'weather-details/:appbar/:station/:lat/:lon/:name/:region/:country/:provider',
            builder: (BuildContext context, GoRouterState state) {
              return WeatherDetailsView(
                lat: state.params['lat']!,
                lon: state.params['lon']!,
                name: state.params['name']!,
                region: state.params['region']!,
                country: state.params['country']!,
                provider: state.params['provider']!,
                stationId: state.params['station']!,
                includeAppBar: state.params['appbar'] == 'true',
              );
            },
          ),
          GoRoute(
            name: 'set-wunderground-api-key',
            path: 'wunderground-api-key',
            builder: (BuildContext context, GoRouterState state) => const SetWundergroundApiKeyView(),
          ),
          GoRoute(
            name: 'set-units',
            path: 'set-units',
            builder: (BuildContext context, GoRouterState state) => const SetUnitsView(),
          ),

        ]
      ),


    ],
    errorPageBuilder: (context, state){
      return MaterialPage(
            key: state.pageKey,
            child: Scaffold(
              body: Center(
                child: Text('Route error ${state.error.toString()}'),
              ),
            ));
      }
  );

  @override
  Widget build(BuildContext context) {
    if (_hasSettingsLoaded == false) return Container();
    final themeMode = ref.watch(settingsProvider.select((s) => s.themeMode));

    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData().copyWith(
        textTheme: textThemeLight,
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: Colors.transparent,
        ),
         // buttonTheme: const ButtonThemeData(
         //   buttonColor: Colors.red,
         // ),
         colorScheme: lightColorScheme
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: textThemeDark,
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: Colors.transparent,
        ),
        colorScheme: darkColorScheme,
      ),
      themeMode: themeMode,
      // home: const WeatherHomeView(),
      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      // onGenerateRoute: (RouteSettings routeSettings) {
      //   return MaterialPageRoute<void>(
      //     settings: routeSettings,
      //     builder: (BuildContext context) {
      //       switch (routeSettings.name) {
      //         case SettingsView.routeName:
      //           return const SettingsView();
      //         // case SampleItemDetailsView.routeName:
      //         //   return const WeatherAreaList();
      //         case WeatherAreaList.routeName:
      //           return const WeatherAreaList();
      //         default:
      //           return const WeatherHomeView();
      //       }
      //     },
      //   );
      // },
    );
  }
}


