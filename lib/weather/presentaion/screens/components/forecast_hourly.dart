import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/state_request.dart';
import '../../../domain/entities/forecast.dart';
import '../../controller/weather_bloc.dart';

class ForecastHourlyComponents extends StatelessWidget {
  const ForecastHourlyComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currTemp = 30; // current temperature
    int maxTemp = 30; // today max temperature
    int minTemp = 2;
    bool isBool = false;

    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) =>
          previous.getForecastByLocationState !=
          current.getForecastByLocationState,
      builder: (context, state) {
        print("BlocBuilder ForecastsHourlyContentComponent");

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
                margin: EdgeInsets.symmetric(vertical: 0.0),
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
                                  BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                )

                              ]),
                          child: Column(children: [
                            Text(
                              "${forecastHourly.temp.toInt()}°",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                            getWeatherIcon(forecastHourly.icon),
                            Text(
                              "${getTimeFromTimestamp(forecastHourly.dt)}",
                              style: TextStyle(
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

Image getWeatherIcon(String _icon) {
  String path = 'assets/images/';
  String imageExtension = '.png';
  return Image.asset(
    path + _icon + imageExtension,
    width: 70,
    height: 70,
  );
}

Image getWeatherIconSmall(String _icon) {
  String path = 'assets/images/';
  String imageExtension = '.png';
  return Image.asset(
    path + _icon + imageExtension,
    width: 40,
    height: 40,
  );
}

Widget hourlyBoxes(dynamic _forecast) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      height: 150.0,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
          scrollDirection: Axis.horizontal,
          itemCount: _forecast.lenght,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.only(
                    left: 10, top: 15, bottom: 15, right: 10),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      )
                    ]),
                child: Column(children: [
                  Text(
                    "${_forecast.hourly[index].temp}°",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  getWeatherIcon(_forecast.hourly[index].icon),
                  Text(
                    "${getTimeFromTimestamp(_forecast.hourly[index].dt)}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                ]));
          }));
}

String getTimeFromTimestamp(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = new DateFormat('h:mm a');
  return formatter.format(date);
}

String getDateFromTimestamp(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = new DateFormat('E');
  return formatter.format(date);
}

Widget dailyBoxes(dynamic _forcast) {
  return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
          itemCount: _forcast.daily.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.only(
                    left: 10, top: 5, bottom: 5, right: 10),
                margin: const EdgeInsets.all(5),
                child: Row(children: [
                  Expanded(
                      child: Text(
                    "${getDateFromTimestamp(_forcast.daily[index].dt)}",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  Expanded(
                      child: getWeatherIconSmall(_forcast.daily[index].icon)),
                  Expanded(
                      child: Text(
                    "${_forcast.daily[index].high.toInt()}/${_forcast.daily[index].low.toInt()}",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )),
                ]));
          }));
}
