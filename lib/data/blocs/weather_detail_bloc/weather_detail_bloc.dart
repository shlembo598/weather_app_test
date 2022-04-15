import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eight_app_weather_test/data/repositories/weather_repository.dart';
import 'package:eight_app_weather_test/resources/app_images.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:l/l.dart';

part 'weather_detail_bloc.freezed.dart';

@freezed
class WeatherDetailEvent with _$WeatherDetailEvent {
  const WeatherDetailEvent._();

  const factory WeatherDetailEvent.load({
    String? townName,
    String? searchValue,
  }) = _LoadWeatherDetailEvent;
}

@freezed
class WeatherDetailState with _$WeatherDetailState {
  const WeatherDetailState._();

  const factory WeatherDetailState.initial() = _InitialWeatherDetailState;

  const factory WeatherDetailState.loading() = _LoadingWeatherDetailState;

  const factory WeatherDetailState.loaded({
    String? townName,
    String? currentWeather,
    String? icon,
  }) = _LoadedWeatherDetailState;

  const factory WeatherDetailState.error() = _ErrorWeatherDetailState;
}

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  final Dio dio = Dio();

  WeatherDetailBloc() : super(const _InitialWeatherDetailState()) {
    on<WeatherDetailEvent>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
      ),
    );
  }

  Future<void> _load(
    _LoadWeatherDetailEvent event,
    Emitter<WeatherDetailState> emitter,
  ) async {
    final searchValue = event.searchValue;
    final townName = event.townName;
    final repository = WeatherRepository(dio);
    try {
      l.i(townName!);
      emitter(const WeatherDetailState.loading());
      await repository.getCurrentWeather(searchValue!).then((weather) {
        // final sky = weather.weather?.first.main.toString();
        final temp = weather.main?.temp?.ceil();
        final weatherIcon = _getWeatherIcon(townName);
        emitter(
          WeatherDetailState.loaded(
            townName: townName,
            currentWeather: temp.toString(),
            icon: weatherIcon,
          ),
        );
      }).timeout(const Duration(seconds: 5));
    } on TimeoutException {
      emitter(const WeatherDetailState.error());
    } on Object {
      emitter(const WeatherDetailState.error());
      rethrow;
    }
  }

  //Здесь просто берем и подставлем киртинку погоды в соотвествии с макетами
  String _getWeatherIcon(String townName) {
    switch (townName) {
      case 'Краснодар':
        return AppImages.sun;
      case 'Москва':
        return AppImages.clouds;
      case 'Санкт-Петербург':
        return AppImages.rain;
      default:
        return AppImages.sun;
    }
  }

//Здесь проверяем данные пришедшие в json и на онове них подставляем картинку

// String _getWeatherIcon(String sky) {
//   String image = '';
//   if (sky.toLowerCase().contains('cloud')) {
//     image = AppImages.clouds;
//   } else if (sky.toLowerCase().contains('rain')) {
//     image = AppImages.rain;
//   } else {
//     image = AppImages.sun;
//   }
//
//   return image;
// }
}
