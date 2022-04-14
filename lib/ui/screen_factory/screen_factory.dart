import 'package:eight_app_weather_test/data/blocs/internet_connection_bloc/internet_connection_bloc.dart';
import 'package:eight_app_weather_test/data/entities/town.dart';
import 'package:eight_app_weather_test/data/utils/utils.dart';
import 'package:eight_app_weather_test/generated/l10n.dart';
import 'package:eight_app_weather_test/ui/screens/home_screen/home_screen.dart';
import 'package:eight_app_weather_test/ui/screens/weather_detail_screen/weather_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/weather_detail_bloc/weather_detail_bloc.dart';

class ScreenFactory {
  Widget makeHomeScreen() {
    return BlocProvider<InternetConnectionBloc>(
      create: (context) =>
          InternetConnectionBloc()..add(const InternetConnectionEvent.create()),
      child: BlocListener<InternetConnectionBloc, InternetConnectionState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            connected: (message) => Utils.showErrorSnackBar(
              context,
              S.of(context).internet_connected,
            ),
            disconnected: (message) => Utils.showErrorSnackBar(
              context,
              S.of(context).internet_disconnected,
            ),
          );
        },
        child: const HomeScreen(),
      ),
    );
  }

  Widget makeWeatherDetailScreen(Town town) {
    final townName = town.name;
    final searchValue = town.searchValue;

    return BlocProvider<WeatherDetailBloc>(
      create: (context) => WeatherDetailBloc()
        ..add(WeatherDetailEvent.load(
          townName: townName,
          searchValue: searchValue,
        )),
      child: const WeatherDetailScreen(),
    );
  }
}
