import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';
import '../entities/location.dart';
import '../repository/base_weather_repository.dart';

class GetForecastWeatherByLocation {
  final BaseWeatherRepository repository;

  GetForecastWeatherByLocation(this.repository);

  Future<Forecast> execute(
      // Location location
      ) async {
    return await repository.getForecastWeatherByLocation(
        // location
        );
  }
}
