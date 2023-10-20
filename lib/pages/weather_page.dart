import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/service/weather_services.dart';
import 'package:weather/utils/consts.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherService = WeatherServices(API_KEY);
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await weatherService.getCurrentCity();
    try {
      final weather = await weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getAnimation(String? condition) {
    print(condition);
    switch (condition) {
      case "cloud":

      case "mist": //

      case "smoke":

      case "hase": //

      case "dust": //sand

      case "fog":
        return "assets/images/cloud.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/images/rain.json";
      case "thunderstorm":
        return "assets/images/thunder.json";
      case "clear":
        return "assets/images/sunny.json";
      default:
        return "assets/images/sunny.json";
    }
  }

  @override
  void initState() {
    _fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.location_pin),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _weather?.cityName ?? " loading...",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Lottie.asset(getAnimation("rain")),
            Text(
              "${_weather?.temperature.round() ?? 0}° ",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
