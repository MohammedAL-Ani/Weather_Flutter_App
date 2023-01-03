import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_flutter_app/core/utils/format_date.dart';
import 'package:weather_flutter_app/core/utils/icon_constants.dart';

import '../../../../core/utils/state_request.dart';

import '../../controller/weather_bloc.dart';

class ForecastHourlyComponents extends StatelessWidget {
  const ForecastHourlyComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) =>
          previous.getForecastByLocationState !=
          current.getForecastByLocationState,
      builder: (context, state) {
        switch (state.getForecastByLocationState) {
          case StateRequest.loading:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case StateRequest.loaded:
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 0.0),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                height: 150.0,
                child: ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 8, top: 0, bottom: 0, right: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.getForecastByLocation.length,
                    itemBuilder: (BuildContext context, int index) {
                      var forecastHourly = state.getForecastByLocation[index];
                      return Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 15, right: 10),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                )
                              ]),
                          child: Column(children: [
                            Text(
                              "${forecastHourly.temp.toInt()}°",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                            AppIconFormat.getWeatherIcon(forecastHourly.icon),
                            Text(
                              AppFormat.getTimeFromTimestamp(forecastHourly.dt),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),
                          ]));
                    }));

          case StateRequest.error:
            return SizedBox(
              height: 400,
              child: Center(
                child: Text(state.getWeatherByCityNameMessage),
              ),
            );
        }
      },
    );
  }
}
