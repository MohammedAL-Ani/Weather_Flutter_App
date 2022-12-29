import 'package:get_it/get_it.dart';

import '../../weather/data/datasource/remote_datasource.dart';
import '../../weather/data/repository/weather_repository.dart';
import '../../weather/domain/repository/base_weather_repository.dart';
import '../../weather/domain/usecases/get_forecast_weather_by_location.dart';
import '../../weather/domain/usecases/get_weather_by_countory.dart';
import '../../weather/presentaion/controller/weather_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => WeatherBloc(sl(), sl()));

    //Use Case
    sl.registerLazySingleton(() => GetWeatherByCountryNameUseCase(sl()));
    sl.registerLazySingleton(() => GetForecastWeatherByLocationUseCase(sl()));

    //Repository
    sl.registerLazySingleton<BaseWeatherRepository>(
        () => WeatherRepository(sl()));

    //DataSource
    sl.registerLazySingleton<BaseWeatherRemoteDataSource>(
        () => WeatherRemoteDataSource());
  }
}
