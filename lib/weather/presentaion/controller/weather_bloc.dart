import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';
import 'package:weather_flutter_app/weather/domain/entities/weather.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/state_request.dart';
import '../../domain/usecases/get_forecast_weather_by_location.dart';
import '../../domain/usecases/get_weather_by_countory.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherByCountryNameUseCase getWeatherByCountryNameUseCase;
  final GetForecastWeatherByLocationUseCase getForecastWeatherByLocationUseCase;
  WeatherBloc(
    this.getWeatherByCountryNameUseCase,
    this.getForecastWeatherByLocationUseCase,
  ) : super(const WeatherState()) {
    on<GetWeatherByCountryNameEvent>(_getWeatherByCityName);

    on<GetForecastWeatherByLocationEvent>(_getForecastByLocation);
  }
  FutureOr<void> _getWeatherByCityName(
      GetWeatherByCountryNameEvent event, Emitter<WeatherState> emit) async {
    final result = await getWeatherByCountryNameUseCase(
        CityNameParameters(cityName: event.cityName));

    result.fold(
      (l) => emit(state.copyWith(
        getWeatherByCityNameMessage: l.message,
        getWeatherByCityNameState: StateRequest.error,
      )),
      (r) => emit(state.copyWith(
        getWeatherByCityName: r,
        getWeatherByCityNameState: StateRequest.loaded,
      )),
    );
  }

  FutureOr<void> _getForecastByLocation(GetForecastWeatherByLocationEvent event,
      Emitter<WeatherState> emit) async {
    final result =
        await getForecastWeatherByLocationUseCase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(
        getForecastByLocationMessage: l.message,
        getForecastByLocationState: StateRequest.error,
      )),
      (r) => emit(
        state.copyWith(
          getForecastByLocation: r,
          getForecastByLocationState: StateRequest.loaded,
        ),
      ),
    );
  }
}
