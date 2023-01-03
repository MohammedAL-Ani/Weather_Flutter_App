import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_flutter_app/core/utils/format_date.dart';
import 'package:weather_flutter_app/core/utils/icon_constants.dart';
import 'package:weather_flutter_app/weather/presentaion/controller/weather_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/state_request.dart';

class ForecastWeekDay extends StatelessWidget {
  const ForecastWeekDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<WeatherBloc, WeatherState>(
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
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0.0),
                height: 300,
                decoration: const BoxDecoration(
                  color: AppColor.subMainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.01,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '3-day forecast',
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.white,
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(
                              left: 8, top: 0, bottom: 0, right: 8),
                          itemCount: state.getForecastByLocation.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            var forecastDaily =
                                state.getForecastByLocation[index];
                            return Column(
                              children: [
                                const Divider(
                                  color: Colors.white,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                      ),
                                      child: Text(
                                        AppFormat.getDateFromTimestamp(
                                            forecastDaily.dt),
                                        style: GoogleFonts.questrial(
                                          color: Colors.white,
                                          fontSize: size.height * 0.025,
                                        ),
                                      ),
                                    ),
                                    AppIconFormat.getWeatherIconSmall(
                                        forecastDaily.icon),
                                    Align(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: size.width * 0.15,
                                        ),
                                        child: Text(
                                          '${forecastDaily.low.toInt()}˚C',
                                          style: GoogleFonts.questrial(
                                            color: isDarkMode
                                                ? Colors.white38
                                                : Colors.white,
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
                                          '${forecastDaily.high.toInt()}˚C',
                                          style: GoogleFonts.questrial(
                                            color: Colors.white,
                                            fontSize: size.height * 0.025,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          // ));
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
