import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/weather.dart';
import '../repository/base_weather_repository.dart';

class GetWeatherByCountryNameUseCase
    extends BaseUseCase<Weather, CityNameParameters> {
  final BaseWeatherRepository repository;

  GetWeatherByCountryNameUseCase(this.repository);

  @override
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
