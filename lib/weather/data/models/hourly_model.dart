import 'package:weather_flutter_app/weather/domain/entities/hourly.dart';

class HourlyModel extends Hourly {
  const HourlyModel(
      {required super.dt,
      required super.temp,
      required super.feelsLike,
      required super.pressure,
      required super.dewPoint,
      required super.uvi,
      required super.visibility,
      required super.wind,
      required super.description,
      required super.icon});

  factory HourlyModel.fromJson(Map<String, dynamic> json) => HourlyModel(
        dt: json['dt'].toInt(),
        temp: json['temp'].toDouble(),
        feelsLike: json['feels_like'].toDouble(),
        pressure: json['pressure'].toDouble(),
        dewPoint: json['dew_point'].toDouble(),
        uvi: json['uvi'].toDouble(),
        visibility: json['visibility'].toDouble(),
        wind: json['wind_speed'].toDouble(),
        description: json['weather'][0]['description'],
        icon: json['weather'][0]['icon'],
      );
}
