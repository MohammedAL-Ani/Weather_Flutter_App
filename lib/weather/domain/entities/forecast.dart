import 'package:equatable/equatable.dart';

class Forecast extends Equatable {
  final int dt;
  final double temp;
  final String main;
  final String dtTxt;
  final String description;
  final String icon;

  const Forecast(
      {required this.dt,
      required this.temp,
      required this.main,
      required this.dtTxt,
      required this.description,
      required this.icon});

  @override
  List<Object> get props => [dt, temp, main, dtTxt, description, icon];
}
