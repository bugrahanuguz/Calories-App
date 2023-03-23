import 'package:flutter/material.dart';

class HomepageViewModel extends ChangeNotifier {
  List meals = [
    "BREAKFAST",
    "LUNCH",
    "DINNER",
  ];
  List calories = [
    "350 kcal",
    "420 kcal",
    "200 kcal",
  ];
  addMeal() {
    meals.add("OTHER");
    calories.add("0 kcal");
    notifyListeners();
  }
}
