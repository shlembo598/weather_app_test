import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../generated/l10n.dart';

class AppConfiguration {
  static const String host = 'http://api.openweathermap.org/';
  static const String hostPrefix = 'data/2.5/weather?q=';
  static const String hostSuffix = '&APPID=';
  static const String units = '&units=metric';
  static const apiKey = String.fromEnvironment('API_KEY');

  static const List<ResponsiveBreakpoint> screenBreakpoints = [
    ResponsiveBreakpoint.resize(375, name: MOBILE),
    ResponsiveBreakpoint.autoScale(800, name: TABLET),
    ResponsiveBreakpoint.resize(1000, name: DESKTOP),
  ];
  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static const Iterable<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('ru', ''),
  ];
}
