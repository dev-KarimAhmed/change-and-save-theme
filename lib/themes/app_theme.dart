import 'package:flutter/material.dart';

class AppTheme {
  static final lightBlueTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
    useMaterial3: true,
    primaryColor: Colors.blue,
    brightness: Brightness.light,
  );
  static final darkBlueTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 6, 84, 163)),
    useMaterial3: true,
    primaryColor: Color.fromARGB(255, 6, 84, 163),
    brightness: Brightness.dark,
  );
  static final darkRedTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 161, 11, 0)),
    useMaterial3: true,
    primaryColor:  Color.fromARGB(255, 161, 11, 0),
    brightness: Brightness.dark,
  );
}