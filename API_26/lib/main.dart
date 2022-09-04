// ignore_for_file: unrelated_type_equality_checks

import 'package:api_26/data_service.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  late WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response == true)
                  Column(
                    children: [
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.tempInfo.temperature}°',
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(_response.weatherInfo.description)
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: const InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: const Text('Search'))
              ],
            ),
          ),
        ));
  }

  void _search() {}
  void search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}