import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/components/animation_splash_screen.dart/splash_screen.dart';
import 'package:softito_final_project/viewmodel/homepage_view_model.dart';
import 'package:softito_final_project/viewmodel/login_view_model.dart';
import 'package:softito_final_project/viewmodel/nutritions_view_model.dart';
import 'package:softito_final_project/viewmodel/reset_password.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';
import 'package:softito_final_project/viewmodel/foods_view_model.dart';
import 'package:softito_final_project/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NutritionViewModel()),
        ChangeNotifierProvider(create: (context) => FoodViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => HomepageViewModel()),
        ChangeNotifierProvider(create: (context) => ResetPasswordViewModel()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
