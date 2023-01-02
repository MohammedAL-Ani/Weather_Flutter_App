import 'dart:ui';

class ApiConstants {
  static const String baseURL = 'https://api.openweathermap.org/data/2.5';

  static const String apiKey = '6381feaa7c4ba1a1a47435a0f38198f6';
  // static const String baseForecastURL = 'api.openweathermap.org/data/2.5/forecast?lat=33.34&lon=44.40&appid=6381feaa7c4ba1a1a47435a0f38198f6';
  static String getWeatherPath(String cityName) =>
      "$baseURL/weather?q=$cityName&appid=$apiKey&units=metric";

  static String getForecastsPath() =>
      "$baseURL/forecast?lat=33.34&lon=44.40&appid=$apiKey&units=metric";
}
