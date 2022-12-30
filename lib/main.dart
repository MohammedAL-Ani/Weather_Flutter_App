import 'package:flutter/material.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/begin_screen.dart';

import 'package:weather_flutter_app/weather/presentaion/screens/home_screen.dart';

void main() async {
  // BaseWeatherRemoteDataSource baseRemoteDataSource = WeatherRemoteDataSource();
  // BaseWeatherRepository baseWeatherRepository =
  // WeatherRepository(baseRemoteDataSource);
  // Forecast weather =
  // await GetForecastWeatherByLocationUseCase(baseWeatherRepository).call(parameters);

  // final dateFormat = DateFormat('h:mm a');
  // final moonLanding = DateTime.parse(weather.dtTxt);
  // final moonLanding2 = DateFormat('EEEE').format(DateTime.parse(weather.dtTxt));
  // final stringFormat = dateFormat.format(DateTime.parse(weather.dtTxt));
  //
  // print(stringFormat);
  // print(FormatDate.getMonthString(moonLanding.weekday));
  // print(moonLanding2);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const BeginScreen(),
    );
  }
}
