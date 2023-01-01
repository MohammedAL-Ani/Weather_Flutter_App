import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/core/usecase/base_usecase.dart';
import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';
import 'package:weather_flutter_app/weather/domain/usecases/get_weather_by_countory.dart';

import '../../../core/error/failure.dart';
import '../entities/location.dart';
import '../entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByCityName(
      CityNameParameters parameters);
  Future<Either<Failure, List<Forecast>>> getForecastWeatherByLocation(
      // Location location
      );
}
