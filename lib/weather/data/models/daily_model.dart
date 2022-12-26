import '../../domain/entities/daily.dart';

class DailyModel extends Daily {
  const DailyModel(
      {required super.dt,
      required super.temp,
      required super.feelsLike,
      required super.low,
      required super.high,
      required super.description,
      required super.pressure,
      required super.humidity,
      required super.wind,
      required super.icon});

  factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
        dt: json['dt'].toInt(),
        temp: json['temp']['day'].toDouble(),
        feelsLike: json['feels_like']['day'].toDouble(),
        low: json['temp']['min'].toDouble(),
        high: json['temp']['max'].toDouble(),
        description: json['weather'][0]['description'],
        pressure: json['pressure'].toDouble(),
        humidity: json['humidity'].toDouble(),
        wind: json['wind_speed'].toDouble(),
        icon: json['weather'][0]['icon'],
      );
}
