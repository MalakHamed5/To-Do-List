import 'package:flutter/material.dart';
import 'package:to_do_list/core/config/theme/theme_data/get_light_theme.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getLightTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
