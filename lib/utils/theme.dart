import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.grey),
      bodyMedium: TextStyle(color: Colors.grey),
      displaySmall: TextStyle(color: Colors.grey),
    ),
    iconTheme: IconThemeData(color: Colors.grey));
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromRGBO(40, 40, 40, 1));
