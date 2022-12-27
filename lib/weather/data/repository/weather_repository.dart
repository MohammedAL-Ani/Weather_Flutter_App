import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

import 'package:weather_flutter_app/weather/domain/entities/location.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repository/base_weather_repository.dart';
import '../datasource/remote_datasource.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String countryName) async {
    return (await baseRemoteDataSource.getWeatherByCountryName(countryName))!;
  }

  @override
  Future<Forecast> getForecastWeatherByLocation(
      // Location location
      ) async {
    return (await baseRemoteDataSource.getForecastWeatherByLonAndLat(
        // location
        ))!;
  }
}
