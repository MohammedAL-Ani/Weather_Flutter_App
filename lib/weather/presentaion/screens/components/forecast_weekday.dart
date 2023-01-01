import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_flutter_app/weather/presentaion/controller/weather_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/state_request.dart';

class ForecastWeekDay extends StatelessWidget {
  const ForecastWeekDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currTemp = 30; // current temperature
    int maxTemp = 30; // today max temperature
    int minTemp = 2;
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        print("BlocBuilder ForecastsWeekDayContentComponent");
        switch (state.getForecastByLocationState) {
          case StateRequest.loading:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case StateRequest.loaded:
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: AppColor.subMainColor,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          left: size.width * 0.03,
                        ),
                        child: Text(
                          '7-day forecast',
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.white,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.005),
                      child: Column(
                        children: [
                          //TODO: change weather forecast from local to api get
                          buildSevenDayForecast(
                            "Today", //day
                            minTemp, //min temperature
                            maxTemp, //max temperature
                            FontAwesomeIcons.cloud, //weather icon
                            size,
                            isDarkMode,
                          ),
                          buildSevenDayForecast(
                            "Wed",
                            -5,
                            5,
                            FontAwesomeIcons.sun,
                            size,
                            isDarkMode,
                          ),
                          buildSevenDayForecast(
                            "Thu",
                            -2,
                            7,
                            FontAwesomeIcons.cloudRain,
                            size,
                            isDarkMode,
                          ),
                          buildSevenDayForecast(
                            "Fri",
                            3,
                            10,
                            FontAwesomeIcons.sun,
                            size,
                            isDarkMode,
                          ),
                          buildSevenDayForecast(
                            "San",
                            5,
                            12,
                            FontAwesomeIcons.sun,
                            size,
                            isDarkMode,
                          ),
                          buildSevenDayForecast(
                            "Sun",
                            4,
                            7,
                            FontAwesomeIcons.cloud,
                            size,
                            isDarkMode,
                          ),
                          buildSevenDayForecast(
                            "Mon",
                            -2,
                            1,
                            FontAwesomeIcons.snowflake,
                            size,
                            isDarkMode,
                          ),
                          buildSevenDayForecast(
                            "Tues",
                            0,
                            3,
                            FontAwesomeIcons.cloudRain,
                            size,
                            isDarkMode,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
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

Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
    IconData weatherIcon, size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.all(
      size.height * 0.005,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
              ),
              child: Text(
                time,
                style: GoogleFonts.questrial(
                  color: Colors.white,
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.25,
              ),
              child: FaIcon(
                weatherIcon,
                color: Colors.white,
                size: size.height * 0.03,
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.15,
                ),
                child: Text(
                  '$minTemp˚C',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white38 : Colors.white,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Text(
                  '$maxTemp˚C',
                  style: GoogleFonts.questrial(
                    color: Colors.white,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    ),
  );
}
