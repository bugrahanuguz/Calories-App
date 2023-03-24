import 'package:flutter/material.dart';

class HomepageViewModel extends ChangeNotifier {
  List meals = ["BREAKFAST", "LUNCH", "DINNER", "OTHER"];
  List<IconData?> mealsIcon = [
    Icons.breakfast_dining_outlined,
    Icons.lunch_dining_outlined,
    Icons.brunch_dining_outlined,
    Icons.local_pizza_outlined
  ];
  List calories = ["350 kcal", "420 kcal", "200 kcal", "100 kcal"];

  addMeal() {
    meals.add("OTHER");
    calories.add("0 kcal");
    notifyListeners();
  }
}
