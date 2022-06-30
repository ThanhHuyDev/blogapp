import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    // primarySwatch: Colors.red,
    primaryColor: const Color(0Xff2B2E4A),
    primaryColorDark: const Color.fromARGB(255, 2, 2, 2),
    primaryColorLight: const Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: Colors.grey[100],
    backgroundColor: const Color(0xFFF4F4F4),
    fontFamily: "Muli",
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 36.0),
      headline2: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 24.0),
      headline3: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 18.0),
      headline4: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 16.0),
      headline5: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 14.0),
      headline6: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.normal,
          fontSize: 14.0),
      bodyText1: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.normal,
          fontSize: 14.0),
      bodyText2: TextStyle(
          color: Color(0Xff2B2E4A),
          fontWeight: FontWeight.normal,
          fontSize: 12.0),
    ),
  );
}
