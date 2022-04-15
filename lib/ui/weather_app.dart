import 'package:eight_app_weather_test/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import '../configuration/app_configuration.dart';
import 'navigation/main_navigation.dart';

class WeatherApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 375,
        defaultScale: true,
        breakpoints: AppConfiguration.screenBreakpoints,
        background: Container(color: AppTheme.backgroundColor),
      ),
      localizationsDelegates: AppConfiguration.localizationsDelegates,
      supportedLocales: AppConfiguration.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: MainNavigationRouteNames.homeScreen,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
