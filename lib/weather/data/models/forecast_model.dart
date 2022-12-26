import 'package:weather_flutter_app/weather/data/models/daily_model.dart';
import 'package:weather_flutter_app/weather/data/models/hourly_model.dart';
import 'package:weather_flutter_app/weather/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  const ForecastModel({required super.hourly, required super.daily});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];
    List<HourlyModel> hourly = [];
    List<DailyModel> daily = [];

    for (var item in hourlyData) {
      var hour = HourlyModel.fromJson(item);
      hourly.add(hour);
    }
    for (var item in dailyData) {
      var day = DailyModel.fromJson(item);
      daily.add(day);
    }

    return ForecastModel(hourly: hourly, daily: daily);
  }
}
