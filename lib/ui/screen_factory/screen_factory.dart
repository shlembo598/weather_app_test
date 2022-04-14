import 'package:dio/dio.dart';
import 'package:eight_app_weather_test/data/entities/town.dart';
import 'package:eight_app_weather_test/ui/screens/home_screen/home_screen.dart';
import 'package:eight_app_weather_test/ui/screens/weather_detail_screen/weather_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/weather_detail_bloc/weather_detail_bloc.dart';
import '../../data/repositories/weather_repository.dart';

class ScreenFactory {
  // NoteRepository noteRepository = NoteRepository();

  Widget makeHomeScreen() {
    return const HomeScreen();
  }

  Widget makeWeatherDetailScreen(Town town) {
    final repository = WeatherRepository(Dio());
    final townName = town.name;
    final searchValue = town.searchValue;

    return BlocProvider<WeatherDetailBloc>(
      create: (context) => WeatherDetailBloc(weatherRepository: repository)
        ..add(WeatherDetailEvent.load(
            townName: townName, searchValue: searchValue)),
      child: const WeatherDetailScreen(),
    );
  }
}
