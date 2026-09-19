import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themedata {
    return ThemeData(

      primaryColor: Colors.deepPurpleAccent,
      scaffoldBackgroundColor: Colors.white,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
          minimumSize: const Size(200, 50),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        )
      ),

      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      
        labelStyle: TextStyle(
          fontSize: 16,
        ),

        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),

      textTheme: const TextTheme(

        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),

        bodyLarge: TextStyle(
          fontSize: 18,
        ),

        bodyMedium: TextStyle(
          fontSize: 16,
        ),
    
      )
    );
  }
}