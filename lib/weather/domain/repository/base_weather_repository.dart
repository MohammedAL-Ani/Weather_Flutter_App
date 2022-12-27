import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

import '../entities/location.dart';
import '../entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Weather> getWeatherByCityName(String cityName);
  Future<Forecast> getForecastWeatherByLocation(
      // Location location
      );
}
