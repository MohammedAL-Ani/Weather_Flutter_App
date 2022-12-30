part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeatherByCountryNameEvent extends WeatherEvent {
  final String cityName;

  const GetWeatherByCountryNameEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class GetForecastWeatherByLocationEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}
