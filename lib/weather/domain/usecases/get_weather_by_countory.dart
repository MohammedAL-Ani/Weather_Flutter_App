import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../entities/weather.dart';
import '../repository/base_weather_repository.dart';

class GetWeatherByCountryNameUseCase {
  final BaseWeatherRepository repository;

  GetWeatherByCountryNameUseCase(this.repository);

  Future<Either<Failure, Weather>> call(CityNameParameters parameters) async {
    return await repository.getWeatherByCityName(parameters);
  }
}

class CityNameParameters extends Equatable {
  final String cityName;
  const CityNameParameters({required this.cityName});

  @override
  List<Object> get props => [cityName];
}
