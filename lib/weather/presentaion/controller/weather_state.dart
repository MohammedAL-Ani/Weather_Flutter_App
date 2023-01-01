part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final Weather? getWeatherByCityName;
  final StateRequest getWeatherByCityNameState;
  final String getWeatherByCityNameMessage;
  final List<Forecast> getForecastByLocation;
  final StateRequest getForecastByLocationState;
  final String getForecastByLocationMessage;

  const WeatherState({
    this.getWeatherByCityName,
    this.getWeatherByCityNameState = StateRequest.loading,
    this.getWeatherByCityNameMessage = "",
    this.getForecastByLocation = const [],
    this.getForecastByLocationState = StateRequest.loading,
    this.getForecastByLocationMessage = "",
  });

  WeatherState copyWith({
    Weather? getWeatherByCityName,
    StateRequest? getWeatherByCityNameState,
    String? getWeatherByCityNameMessage,
    List<Forecast>? getForecastByLocation,
    StateRequest? getForecastByLocationState,
    String? getForecastByLocationMessage,
  }) {
    return WeatherState(
      getWeatherByCityName: getWeatherByCityName ?? this.getWeatherByCityName,
      getWeatherByCityNameState:
          getWeatherByCityNameState ?? this.getWeatherByCityNameState,
      getWeatherByCityNameMessage:
          getWeatherByCityNameMessage ?? this.getWeatherByCityNameMessage,
      getForecastByLocation:
          getForecastByLocation ?? this.getForecastByLocation,
      getForecastByLocationState:
          getForecastByLocationState ?? this.getForecastByLocationState,
      getForecastByLocationMessage:
          getForecastByLocationMessage ?? this.getForecastByLocationMessage,
    );
  }

  @override
  List<Object?> get props => [
        getWeatherByCityName,
        getWeatherByCityNameState,
        getWeatherByCityNameMessage,
        getForecastByLocation,
        getForecastByLocationState,
        getForecastByLocationMessage,
      ];
}
