import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  const ForecastModel(
      {required super.dt,
      required super.temp,
      required super.main,
      required super.dtTxt,
      required super.description,
      required super.icon});

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        dt: json['list'][0]['dt'].toInt(),
        temp: json['list'][0]['main']['temp'].toDouble(),
        main: json['list'][0]['weather'][0]['main'],
        dtTxt: json['list'][0]['dt_txt'],
        description: json['list'][0]['weather'][0]['description'],
        icon: json['list'][0]['weather'][0]['icon'],
      );
}
