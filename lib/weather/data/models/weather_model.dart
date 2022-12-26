import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel(
      {required super.temp,
      required super.feelsLike,
      required super.low,
      required super.high,
      required super.description,
      required super.pressure,
      required super.humidity,
      required super.wind,
      required super.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return WeatherModel(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}
