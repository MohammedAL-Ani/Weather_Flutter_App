import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/weather/domain/entities/daily.dart';
import 'package:weather_flutter_app/weather/domain/entities/hourly.dart';

class Forecast extends Equatable {
  final List<Hourly> hourly;
  final List<Daily> daily;

  const Forecast({required this.hourly, required this.daily});

  @override
  List<Object> get props => [hourly, daily];
}
