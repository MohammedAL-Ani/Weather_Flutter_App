
import '../enities/weather.dart';

abstract class WeatherRepository{
  Future<Weather> getWeatherByCityName( String cityName);
}