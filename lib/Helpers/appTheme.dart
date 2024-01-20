import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue,
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16.0),
  ),
);


final ThemeData dashboardTheme = ThemeData(
  primarySwatch: Colors.blue,
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800,decoration: TextDecoration.underline),
    displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,decoration: TextDecoration.underline),
    bodyMedium: TextStyle(fontSize: 16.0),
  ),
);