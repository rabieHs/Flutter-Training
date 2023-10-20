// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json["name"] ?? "gabes",
        temperature: json["main"]["temp"].toDouble(),
        mainCondition: json["weather"][0]["main"] ?? "sunny");
  }
}
