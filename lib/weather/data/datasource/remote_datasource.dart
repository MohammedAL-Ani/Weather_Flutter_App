import 'package:dio/dio.dart';
import 'package:weather_flutter_app/weather/data/models/forecast_model.dart';
import 'package:weather_flutter_app/weather/domain/entities/location.dart';
import 'package:weather_flutter_app/weather/domain/usecases/get_weather_by_countory.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../models/weather_model.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCountryName(CityNameParameters parameters);
  Future<List<ForecastModel>> getForecastWeatherByLonAndLat(
      // Location location
      );
}

class WeatherRemoteDataSource implements BaseWeatherRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherByCountryName(
      CityNameParameters parameters) async {
    {
      var response =
          await Dio().get(ApiConstants.getWeatherPath(parameters.cityName));
      // print(response);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    }
  }

  @override
  Future<List<ForecastModel>> getForecastWeatherByLonAndLat(
      // Location location
      ) async {
    {
      // String lat = location.lat;
      // String lon = location.lon;
      var response = await Dio().get(
          '${ApiConstants.baseURL}/forecast?lat=33.34&lon=44.40&appid=${ApiConstants.apiKey}');
      if (response.statusCode == 200) {
        print(response.data["list"]);
        return List<ForecastModel>.from((response.data["list"] as List).map(
          (e) => ForecastModel.fromJson(e),
        ));
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    }
  }
}
