import 'package:eight_app_weather_test/data/entities/town.dart';
import 'package:flutter/material.dart';

import '../screen_factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const homeScreen = '/';
  static const weatherDetailScreen = '/weatherDetail';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.homeScreen: (_) => _screenFactory.makeHomeScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.weatherDetailScreen:
        final town = settings.arguments as Town;

        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeWeatherDetailScreen(town),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
