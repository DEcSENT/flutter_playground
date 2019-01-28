/*
 * Copyright (c) 2019 by Denis Verentsov (decsent@yandex.ru)
 * All rights reserved.
 */

import 'dart:convert';
import 'package:flutter_playground/data/weather/WeatherData.dart';
import 'package:http/http.dart' as http;

class WeatherApiProvider {
  static const WEATHER_API_KEY = 'e2d1f3f36b83172869e7140e4c2552c3';

  Future<WeatherData> fetchWeatherByCoordinates(double lat, double lon) async {
    var response = await http.get(
        'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$WEATHER_API_KEY');

    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error
      throw Exception('Failed to load weather data');
    }
  }
}
