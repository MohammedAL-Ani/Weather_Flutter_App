import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  const ForecastModel(
      {required super.dt,
      required super.temp,
      required super.high,
      required super.low,
      required super.dtTxt,
      required super.wind,
      required super.icon});

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        dt: json['dt'].toInt(),
        temp: json['main']['temp'].toDouble(),
        low: json['main']['temp_min'].toDouble(),
        high: json['main']['temp_max'].toDouble(),
        dtTxt: json['dt_txt'],
        wind: json['wind']['speed'].toDouble(),
        icon: json['weather'][0]['icon'],
      );
}
