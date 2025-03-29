import 'package:drive_mate/screens/bottom_navi_screen.dart';
import 'package:drive_mate/screens/car_selection_screen.dart';
import 'package:drive_mate/screens/sign_in_screen.dart';
import 'package:drive_mate/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/sign_in': (context) => SignInScreen(),
        '/car_selection': (context) => CarSelectionScreen(),
        '/bottom_navi': (context) => BottomNaviScreen(),
      },
    );
  }
}
