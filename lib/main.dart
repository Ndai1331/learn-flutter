import 'package:flutter/material.dart';
import 'screens/splash_screen_with_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Splash screen là màn hình đầu tiên, sau 2 giây sẽ tự động chuyển đến WelcomeScreen
      home: const SplashScreenWithImage(),
    );
  }
}
