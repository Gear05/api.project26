// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:api_26/models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    if (kDebugMode) {
      print(response.body);
    }
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}