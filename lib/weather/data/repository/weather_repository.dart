import 'package:dartz/dartz.dart';
import 'package:weather_flutter_app/core/error/failure.dart';
import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

import 'package:weather_flutter_app/weather/domain/entities/location.dart';
import 'package:weather_flutter_app/weather/domain/usecases/get_weather_by_countory.dart';

import '../../../core/error/exception.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repository/base_weather_repository.dart';
import '../datasource/remote_datasource.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseWeatherRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, Weather>> getWeatherByCityName(
      CityNameParameters parameters) async {
    final result =
        await baseRemoteDataSource.getWeatherByCountryName(parameters);
    try {
      return Right(result!);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Forecast>> getForecastWeatherByLocation(
      // Location location
      ) async {
    final result =
        await baseRemoteDataSource.getForecastWeatherByLonAndLat(// location
            );
    try {
      return Right(result!);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
