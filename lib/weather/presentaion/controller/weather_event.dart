part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByCountryNameEvent extends WeatherEvent {}

class GetForecastWeatherByLocationEvent extends WeatherEvent {}
