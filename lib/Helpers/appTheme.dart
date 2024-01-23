import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue,
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),
    titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: 'Outfit'),
    bodyMedium: TextStyle(fontSize: 16.0,fontFamily: 'Outfit'),
    bodySmall: TextStyle(fontSize: 10.0,fontFamily: 'Outfit'),
  ),
);


final ThemeData dashboardTheme = ThemeData(
  primarySwatch: Colors.blue,
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),
    displayLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700,decoration: TextDecoration.underline,fontFamily: 'Outfit'),
    displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,fontFamily: 'Outfit'),
    titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600,decoration: TextDecoration.underline,fontFamily: 'Outfit',),
    bodyMedium: TextStyle(fontSize: 16.0),
  ),
);


final ThemeData sideMenuTheme = ThemeData(
  primarySwatch: Colors.blue,
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),
    displayLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700,decoration: TextDecoration.underline,fontFamily: 'Outfit'),
    displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,fontFamily: 'Outfit'),
    titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600,decoration: TextDecoration.underline,fontFamily: 'Outfit',),
    bodyMedium: TextStyle(fontSize: 16.0, fontFamily: 'Outfit'),
  ),
);

final ThemeData constantTheme = ThemeData(
  primarySwatch: Colors.blue,
  // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),
    displayLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700,decoration: TextDecoration.underline,fontFamily: 'Outfit'),
    displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,fontFamily: 'Outfit'),
    titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600,decoration: TextDecoration.underline,fontFamily: 'Outfit',),
    bodyMedium: TextStyle(fontSize: 16.0, fontFamily: 'Outfit'),
  ),
);