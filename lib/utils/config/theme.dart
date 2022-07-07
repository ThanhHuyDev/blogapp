import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColorDark: const Color(0xff757575),
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      primaryColorDark: const Color.fromARGB(255, 223, 222, 222),
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
    ),
  };
}

// ThemeData theme() {
//   return ThemeData(
//     // primarySwatch: Colors.red,
//     primaryColor: const Color(0Xff2B2E4A),
//     primaryColorDark: const Color.fromARGB(255, 2, 2, 2),
//     primaryColorLight: const Color.fromARGB(255, 255, 255, 255),
//     scaffoldBackgroundColor: Colors.grey[100],
//     backgroundColor: const Color(0xFFF4F4F4),
//     fontFamily: "Muli",
//     textTheme: const TextTheme(
//       headline1: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.bold,
//           fontSize: 36.0),
//       headline2: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.bold,
//           fontSize: 24.0),
//       headline3: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.bold,
//           fontSize: 18.0),
//       headline4: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.bold,
//           fontSize: 16.0),
//       headline5: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.bold,
//           fontSize: 14.0),
//       headline6: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.normal,
//           fontSize: 14.0),
//       bodyText1: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.normal,
//           fontSize: 14.0),
//       bodyText2: TextStyle(
//           color: Color(0Xff2B2E4A),
//           fontWeight: FontWeight.normal,
//           fontSize: 12.0),
//     ),
//   );
// }
