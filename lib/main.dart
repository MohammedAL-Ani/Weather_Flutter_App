import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_app/core/utils/format_date.dart';

import 'package:weather_flutter_app/weather/data/datasource/remote_datasource.dart';
import 'package:weather_flutter_app/weather/data/repository/weather_repository.dart';
import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

import 'package:weather_flutter_app/weather/domain/entities/weather.dart';
import 'package:weather_flutter_app/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_flutter_app/weather/domain/usecases/get_forecast_weather_by_location.dart';
import 'package:weather_flutter_app/weather/domain/usecases/get_weather_by_countory.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/card_weather.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/home_screen.dart';

void main() async {
  BaseWeatherRemoteDataSource baseRemoteDataSource = WeatherRemoteDataSource();
  BaseWeatherRepository baseWeatherRepository =
      WeatherRepository(baseRemoteDataSource);
  Forecast weather =
      await GetForecastWeatherByLocationUseCase(baseWeatherRepository).execute();

  final dateFormat = DateFormat('h:mm a');
  final moonLanding = DateTime.parse(weather.dtTxt);
  final moonLanding2 = DateFormat('EEEE').format(DateTime.parse(weather.dtTxt));
  final stringFormat = dateFormat.format(DateTime.parse(weather.dtTxt));

  print(stringFormat);
  print(FormatDate.getMonthString(moonLanding.weekday));
  print(moonLanding2);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const WeatherBox(),
    );
  }
}
