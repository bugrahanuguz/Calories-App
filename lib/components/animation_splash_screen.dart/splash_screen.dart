import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:softito_final_project/views/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/splash.json'),
      nextScreen: LoginPage(),
      backgroundColor: Colors.grey.shade300,
      splashIconSize: 250,
      duration: 2000,
      splashTransition: SplashTransition.sizeTransition,
      animationDuration: const Duration(seconds: 0),
    );
  }
}
