import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData get themedata {

    return ThemeData(

      primaryColor: Colors.lightBlue,

      scaffoldBackgroundColor: Colors.white,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
      ),

      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            width: 2,
          ),
        ),
      ),

      iconTheme: const IconThemeData(
        color: Colors.lightBlue,
      ),

    );
  }
}