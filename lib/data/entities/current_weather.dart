import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

@freezed
class CurrentWeather with _$CurrentWeather {
  @JsonSerializable(explicitToJson: true)
  const factory CurrentWeather({
    required Coord? coord,
    required List<Weather>? weather,
    required String? base,
    required Main? main,
    required int? visibility,
    required Wind? wind,
    required Clouds? clouds,
    required int? dt,
    required Sys? sys,
    required int? timezone,
    required int? id,
    required String? name,
    required int? cod,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    required int? all,
  }) = _Clouds;
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    required double? lon,
    required double? lat,
  }) = _Coord;
  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    required double? temp,
    required double? feelsLike,
    required double? tempMin,
    required double? tempMax,
    required int? pressure,
    required int? humidity,
  }) = _Main;
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    required int? type,
    required int? id,
    required double? message,
    required String? country,
    required int? sunrise,
    required int? sunset,
  }) = _Sys;
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    required int? id,
    required String? main,
    required String? description,
    required String? icon,
  }) = _Weather;
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    required double? speed,
    required int? deg,
  }) = _Wind;
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
