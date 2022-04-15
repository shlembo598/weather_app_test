class AppConfiguration {
  static const String host = 'http://api.openweathermap.org/';
  static const String hostPrefix = 'data/2.5/weather?q=';
  static const String hostSuffix = '&APPID=';
  static const String units = '&units=metric';
  static const apiKey = String.fromEnvironment('API_KEY');
}
