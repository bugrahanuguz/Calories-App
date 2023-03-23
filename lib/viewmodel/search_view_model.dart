import 'package:flutter/material.dart';
import 'package:softito_final_project/models/nutritions_model.dart';

class SearchViewModel extends ChangeNotifier {
  List food = [];
  List<Nutritions> foodList = [];

  addFood(String txt) {
    food.add(txt);
    notifyListeners();
  }

  addFoodList(Nutritions nutrit) {
    foodList.add(nutrit);
    notifyListeners();
  }

  removeFood(int index) {
    foodList.removeAt(index);
    notifyListeners();
  }
}
