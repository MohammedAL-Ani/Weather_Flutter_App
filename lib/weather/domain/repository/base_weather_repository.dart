import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

import '../../../core/error/failure.dart';
import '../entities/location.dart';
import '../entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByCityName(String cityName);
  Future<Either<Failure, Forecast>> getForecastWeatherByLocation(
      // Location location
      );
}
