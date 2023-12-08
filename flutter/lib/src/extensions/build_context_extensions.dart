// build_context_extensions.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get style => Theme.of(this).textTheme;

  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}