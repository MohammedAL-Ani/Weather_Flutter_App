import 'package:equatable/equatable.dart';

class Hourly extends Equatable {
  final int dt;
  final double temp;
  final double feelsLike;
  final double pressure;
  final double dewPoint;
  final double uvi;
  final double visibility;
  final double wind;
  final String description;
  final String icon;

  const Hourly(
      {required this.dt,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.dewPoint,
      required this.uvi,
      required this.visibility,
      required this.wind,
      required this.description,
      required this.icon});

  @override
  List<Object> get props => [
        dt,
        temp,
        feelsLike,
        pressure,
        dewPoint,
        uvi,
        visibility,
        wind,
        description,
        icon,
      ];
}
