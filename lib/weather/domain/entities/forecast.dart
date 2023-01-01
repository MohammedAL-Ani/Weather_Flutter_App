import 'package:equatable/equatable.dart';

class Forecast extends Equatable {
  final int dt;
  final double temp;
  final double low;
  final double high;
  final String dtTxt;
  final double wind;
  final String icon;

  const Forecast(
      {required this.dt,
      required this.temp,
      required this.low,
      required this.high,
      required this.dtTxt,
      required this.wind,
      required this.icon});

  @override
  List<Object> get props => [dt, temp, low, high, dtTxt, wind, icon];
}
