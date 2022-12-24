
import '../enities/weather.dart';

abstract class BaseWeatherRepository{
  Future<Weather> getWeatherByCityName( String cityName);
}