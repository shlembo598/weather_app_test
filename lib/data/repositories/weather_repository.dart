import 'package:dio/dio.dart';
import 'package:eight_app_weather_test/data/entities/current_weather.dart';
import 'package:retrofit/retrofit.dart';

import '../../configuration/app_configuration.dart';

part 'weather_repository.g.dart';

@RestApi(baseUrl: AppConfiguration.host)
abstract class WeatherRepository {
  factory WeatherRepository(Dio dio, {String baseUrl}) = _WeatherRepository;

  static const String prefix = AppConfiguration.hostPrefix;
  static const String host = AppConfiguration.host;
  static const String suffix = AppConfiguration.hostSuffix;
  static const String apiKey = AppConfiguration.apiKey;
  static const String units = AppConfiguration.units;

  @GET(
    "$host$prefix{townName}$suffix$apiKey$units",
  )
  Future<CurrentWeather> getCurrentWeather(@Path("townName") String townName);
}
