import 'package:dio/dio.dart';
import 'package:weather_flutter_app/weather/data/models/forecast_model.dart';
import 'package:weather_flutter_app/weather/domain/entities/location.dart';

import '../../../core/utils/constants.dart';
import '../models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
  Future<ForecastModel?> getForecastWeatherByLonAndLat(
      // Location location
      );
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async {
    {
      try {
        var response = await Dio().get(
            '${AppConstants.baseURL}/weather?q=$countryName&appid=${AppConstants.appKey}');
        print(response);
        return WeatherModel.fromJson(response.data);
      } catch (e) {
        print(e);
        return null;
      }
    }
  }

  @override
  Future<ForecastModel?> getForecastWeatherByLonAndLat(
      // Location location
      ) async {
    {
      try {
        // String lat = location.lat;
        // String lon = location.lon;
        var response = await Dio().get(
            '${AppConstants.baseURL}/forecast?lat=33.34&lon=44.40&appid=${AppConstants.appKey}');
        print(response);
        return ForecastModel.fromJson(response.data);
      } catch (e) {
        print(e);
        return null;
      }
    }
  }
}
