import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/shared_providers/weather_areas_provider.dart';


import 'settings_provider.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends ConsumerWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  // final SettingsController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final provider = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SearchArea(),
              SizedBox(height: 20),
              _SystemTheme(),
              SizedBox(height: 20),
              _Units(),
              SizedBox(height: 20),
              WundergroundApiKey(),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DriftDbViewer(database)));
              }, child: Text('db viewer')),
            ],
          )),
        ),
      ),
    );
  }
}


class _SystemTheme extends ConsumerWidget {
  const _SystemTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final provider = ref.watch(settingsProvider);

    return DropdownButton<ThemeMode>(
      // Read the selected themeMode from the controller
      value: provider.themeMode,
      // Call the updateThemeMode method any time the user selects a theme.
      onChanged: ref.read(settingsProvider).updateThemeMode,
      items: const [
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text('System Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Text('Light Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text('Dark Theme'),
        )
      ],
    );
  }
}


class _Units extends StatelessWidget {
  const _Units({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: const Text('Set units'),  onPressed: (){
      context.goNamed('set-units');
    },);
  }
}


class WundergroundApiKey extends StatelessWidget {
  const WundergroundApiKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: const Text('Set wunderground API key'), onPressed: (){
      context.goNamed('set-wunderground-api-key');
    },);

  }
}



