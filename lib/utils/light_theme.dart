import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.green[800],
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green.shade800, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent, foregroundColor: Colors.black),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Color.fromARGB(255, 0, 0, 0),
      unselectedLabelColor: Colors.grey,
    ),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 0, 0, 0),
      opacity: 1,
      size: 24,
    ),
    primaryIconTheme: const IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(108, 210, 87, 1),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    )),

    // Define the default font family.
    fontFamily: 'Georgia',
    chipTheme: const ChipThemeData(
        backgroundColor: Colors.white,
        disabledColor: Colors.white,
        side: BorderSide(color: Colors.black),
        secondarySelectedColor: Color.fromRGBO(218, 238, 203, 1),
        secondaryLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        labelStyle: TextStyle(color: Colors.black)));
