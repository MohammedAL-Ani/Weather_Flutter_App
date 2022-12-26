import 'package:equatable/equatable.dart';

class Daily extends Equatable {
  final int dt;
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double pressure;
  final double humidity;
  final double wind;
  final String icon;

  const Daily(
      {required this.dt,
      required this.temp,
      required this.feelsLike,
      required this.low,
      required this.high,
      required this.description,
      required this.pressure,
      required this.humidity,
      required this.wind,
      required this.icon});

  @override
  List<Object> get props => [
        dt,
        temp,
        feelsLike,
        low,
        high,
        description,
        pressure,
        humidity,
        wind,
        icon,
      ];
}
