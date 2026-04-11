import 'package:flutter/material.dart';
import 'views/splash_screen.dart';
import 'views/login_screen.dart';
import 'views/onboarding_screen.dart';
import 'views/home_screen.dart';
import 'views/body_pillar.dart';
import 'views/mind_pillar.dart';
import 'views/soul_pillar.dart';
import 'views/money_pillar.dart';
import 'views/academy_pillar.dart';

void main() {
  runApp(const SoloLevelingApp());
}

class SoloLevelingApp extends StatelessWidget {
  const SoloLevelingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solo Leveling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/body': (context) => const BodyPillarScreen(),
        '/mind': (context) => const MindPillarScreen(),
        '/soul': (context) => const SoulPillarScreen(),
        '/money': (context) => const MoneyPillarScreen(),
        '/academy': (context) => const AcademyPillarScreen(),
      },
    );
  }
}
