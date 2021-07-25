import 'package:calculator_app/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';


ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    button: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 16.0
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  primaryColor: Colors.redAccent,
  primarySwatch: defaultColor,

  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    // for status bar options
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      color: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25.0),
      elevation: 0.0),
    // outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(elevation: MaterialStateProperty.all(0.1)))

);


ThemeData darkTheme = ThemeData(

  textTheme: TextTheme(
    button: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
        fontSize: 16.0,

    ),
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  primaryColor: Colors.redAccent,
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('4b4d45'),
  appBarTheme: AppBarTheme(
    // for status bar options
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('4b4d45'),
    ),
    color: HexColor('4b4d45'),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
    ),
    elevation: 0.0,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(elevation: MaterialStateProperty.all(1.0) ),)
);