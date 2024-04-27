import 'package:weatherapp_starter_project/model/weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  WeatherData([this.current]);
  WeatherDataCurrent getCurrentWeather() => current!;
}
