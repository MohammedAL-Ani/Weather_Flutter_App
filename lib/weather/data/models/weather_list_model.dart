import 'package:weather_flutter_app/weather/domain/entities/weather_list.dart';

class WeatherListModel extends WeatherList {
  const WeatherListModel(
      {required super.id,
      required super.main,
      required super.description,
      required super.icon});

  factory WeatherListModel.fromJson(Map<String, dynamic> json) {
    return WeatherListModel(
      id: json['weather']['id'].toDouble(),
      main: json['weather']['main'].toDouble(),
      description: json['weather']['description'],
      icon: json['weather']['icon'],
    );
  }
}
