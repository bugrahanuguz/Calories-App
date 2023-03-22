import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/login_view_model.dart';
import 'package:softito_final_project/viewmodel/nutritions_view_model.dart';
import 'package:softito_final_project/viewmodel/users_view_model.dart';
import 'package:softito_final_project/views/home_page.dart';
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
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
