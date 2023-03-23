import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/nutritions_view_model.dart';
import 'package:softito_final_project/viewmodel/users_view_model.dart';
import '../components/home_page/buttons.dart';
import '../components/home_page/calories_widget.dart';
import '../components/home_page/circular_progress.dart';
import '../components/home_page/meal_card.dart';
import '../components/nutrition_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //UserModel user = context.watch<UserViewModel>().user;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text(
            "Today",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const CircularProgress(),
          const CaloriesWidget(),
          const HomePageButtons(),
          const MealCard(),
        ],
      ),
    );
  }
}
