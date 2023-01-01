import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double pressure;
  final double humidity;
  final double wind;
  final int windDeg;
  final String icon;

  const Weather(
      {required this.temp,
      required this.feelsLike,
      required this.low,
      required this.high,
      required this.description,
      required this.pressure,
      required this.humidity,
      required this.wind,
      required this.windDeg,
      required this.icon});

  @override
  List<Object> get props => [
        temp,
        feelsLike,
        low,
        high,
        description,
        pressure,
        humidity,
        wind,
        windDeg,
        icon,
      ];
}
