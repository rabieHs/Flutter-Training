import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/utils/consts.dart';

import '../models/weather_model.dart';
import "package:http/http.dart" as http;

class WeatherServices {
  final String apiKey;
  WeatherServices(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse("$BASE_URL?q=$cityName&appid=$apiKey&units=metric"));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error getting weather");
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? cityName = placeMark[0].locality;

    return cityName ?? "gabes";
  }
}
