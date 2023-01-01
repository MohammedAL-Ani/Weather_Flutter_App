import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_flutter_app/core/usecase/base_usecase.dart';
import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';
import '../../../core/error/failure.dart';
import '../entities/location.dart';
import '../repository/base_weather_repository.dart';

class GetForecastWeatherByLocationUseCase
    extends BaseUseCase<List<Forecast>, NoParameters> {
  final BaseWeatherRepository repository;

  GetForecastWeatherByLocationUseCase(this.repository);

  @override
  Future<Either<Failure, List<Forecast>>> call(NoParameters parameters
      // Location location
      ) async {
    return await repository.getForecastWeatherByLocation(
        // location
        );
  }
}

class LocationParameters extends Equatable {
  final int location;
  const LocationParameters({required this.location});

  @override
  List<Object> get props => [location];
}
