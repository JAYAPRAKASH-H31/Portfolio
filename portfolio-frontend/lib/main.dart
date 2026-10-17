import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jayaprakash H | Portfolio - Flutter & Java Developer',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}