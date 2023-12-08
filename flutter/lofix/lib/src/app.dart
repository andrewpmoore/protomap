import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';


const Color standardTextLight = Color(0xff0b3656);
const Color standardLabelLight = Color(0xff7B94A7);

const Color standardTextDark = Color(0xfffffffb);
const Color standardLabelDark = Color(0xff7B94A7);

const Color standardLabel = Color(0xff7B94A7);


TextTheme textThemeLight = TextTheme(
  displayLarge: TextStyle(debugLabel: 'workSans displayLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none, letterSpacing: -5, fontSize: 72),
  displayMedium: TextStyle(debugLabel: 'workSans displayMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  displaySmall: TextStyle(debugLabel: 'workSans displaySmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  headlineLarge: TextStyle(debugLabel: 'workSans headlineLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none, letterSpacing: -2),
  headlineMedium: TextStyle(debugLabel: 'workSans headlineMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  headlineSmall: TextStyle(debugLabel: 'workSans headlineSmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  titleLarge: TextStyle(debugLabel: 'workSans titleLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  titleMedium: TextStyle(debugLabel: 'workSans titleMedium', fontFamily: GoogleFonts.workSans().fontFamily, color:standardTextLight, decoration: TextDecoration.none, ),
  titleSmall: TextStyle(debugLabel: 'workSans titleSmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none, fontWeight: FontWeight.w600),
  bodyLarge: TextStyle(debugLabel: 'workSans bodyLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  bodyMedium: TextStyle(debugLabel: 'workSans bodyMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  bodySmall: TextStyle(debugLabel: 'workSans bodySmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  labelLarge: TextStyle(debugLabel: 'workSans labelLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardLabelLight, decoration: TextDecoration.none,),
  labelMedium: TextStyle(debugLabel: 'workSans labelMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextLight, decoration: TextDecoration.none,),
  labelSmall: TextStyle(debugLabel: 'workSans labelSmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardLabelLight, decoration: TextDecoration.none,letterSpacing: -0.3),
);

TextTheme textThemeDark = TextTheme(
  displayLarge: TextStyle(debugLabel: 'workSans displayLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none, letterSpacing: -5, fontSize: 72),
  displayMedium: TextStyle(debugLabel: 'workSans displayMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  displaySmall: TextStyle(debugLabel: 'workSans displaySmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  headlineLarge: TextStyle(debugLabel: 'workSans headlineLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none, letterSpacing: -2),
  headlineMedium: TextStyle(debugLabel: 'workSans headlineMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  headlineSmall: TextStyle(debugLabel: 'workSans headlineSmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  titleLarge: TextStyle(debugLabel: 'workSans titleLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  titleMedium: TextStyle(debugLabel: 'workSans titleMedium', fontFamily: GoogleFonts.workSans().fontFamily, color:standardTextDark, decoration: TextDecoration.none, ),
  titleSmall: TextStyle(debugLabel: 'workSans titleSmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none, fontWeight: FontWeight.w600),
  bodyLarge: TextStyle(debugLabel: 'workSans bodyLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  bodyMedium: TextStyle(debugLabel: 'workSans bodyMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  bodySmall: TextStyle(debugLabel: 'workSans bodySmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  labelLarge: TextStyle(debugLabel: 'workSans labelLarge', fontFamily: GoogleFonts.workSans().fontFamily, color: standardLabelDark, decoration: TextDecoration.none,),
  labelMedium: TextStyle(debugLabel: 'workSans labelMedium', fontFamily: GoogleFonts.workSans().fontFamily, color: standardTextDark, decoration: TextDecoration.none,),
  labelSmall: TextStyle(debugLabel: 'workSans labelSmall', fontFamily: GoogleFonts.workSans().fontFamily, color: standardLabelDark, decoration: TextDecoration.none,letterSpacing: -0.3),
);

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
