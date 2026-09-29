import 'package:examen/themes/app_theme.dart';
import 'package:examen/widgets/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
   const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppTheme.themedata,
      home: Login()
    );
  }
}
