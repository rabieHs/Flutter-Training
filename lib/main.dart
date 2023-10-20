import 'package:flutter/material.dart';
import 'package:weather/pages/weather_page.dart';
import 'package:weather/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: WeatherPage());
  }
}
