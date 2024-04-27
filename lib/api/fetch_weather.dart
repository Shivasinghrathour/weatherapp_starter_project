import 'dart:convert';
import 'package:weatherapp_starter_project/api/api_key.dart';
import 'package:weatherapp_starter_project/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/model/weather_data_current.dart';

class FetchWeatherAPi {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var responce = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(responce.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";
  return url;
}
