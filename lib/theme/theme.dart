import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Color.fromARGB(255, 255, 249, 247),
    secondary: Color.fromARGB(255, 245, 243, 243),
  ),
  brightness: Brightness.light,
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 14, 14, 15),
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 14, 14, 15),
        ),
      ),
);

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 36, 36, 36),
    primary: Color.fromARGB(255, 97, 97, 97),
    secondary: Color.fromARGB(255, 117, 117, 117),
  ),
  brightness: Brightness.dark,
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 121, 121, 121),
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 121, 121, 121),
        ),
      ),
);
