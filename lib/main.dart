import 'package:astrology_app/core/theme/app_theme.dart';
import 'package:astrology_app/features/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AstroGuide",
      home: HomeScreen(),
      theme: AppTheme.darkTheme,
    );
  }
}
