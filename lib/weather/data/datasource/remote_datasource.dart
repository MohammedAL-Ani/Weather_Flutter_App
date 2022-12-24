import 'package:dio/dio.dart';

import '../../../core/utils/constants.dart';
import '../models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
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
}
