import 'package:flutter/material.dart';
import 'package:moviiku_app/src/screens/screens.dart';
import 'package:moviiku_app/src/utilities/utilities.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: const HomeScreen(),
    );
  }
}
