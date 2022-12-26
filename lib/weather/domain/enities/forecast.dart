import 'package:weather_flutter_app/weather/domain/enities/daily.dart';
import 'package:weather_flutter_app/weather/domain/enities/hourly.dart';

class Forecast {
  final List<Hourly> hourly;
  final List<Daily> daily;

  Forecast(this.hourly, this.daily);
}
