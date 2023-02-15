import 'package:flutter/material.dart';
import 'package:moviiku_app/src/utilities/utilities.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: myTheme,
    );
  }
}
