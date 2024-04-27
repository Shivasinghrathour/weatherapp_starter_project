import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempeatureAreWigget(),
      ],
    );
  }

  Widget tempeatureAreWigget() {
    return Row(
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
        )
      ],
    );
  }
}
