import 'package:flutter/material.dart';
import 'package:softito_final_project/models/nutritions_model.dart';

class SearchViewModel extends ChangeNotifier {
  List food = [];
  List<Nutritions> foodList = [];
  double cal = 0;
  double protein = 0;
  double carb = 0;
  double fat = 0;
  int buttonName = 0;

  addFood(String txt) {
    food.add(txt);
    notifyListeners();
  }

  addFoodList(Nutritions nutrit, int index) {
    foodList.add(nutrit);
    cal += double.parse(foodList[index].calories.toString());
    protein += double.parse(foodList[index].proteinG.toString());
    carb += double.parse(foodList[index].carbohydratesTotalG.toString());
    fat += double.parse(foodList[index].fatTotalG.toString());
    print(cal);
    notifyListeners();
  }

  removeFood(int index) {
    cal -= double.parse(foodList[index].calories.toString());
    protein -= double.parse(foodList[index].proteinG.toString());
    carb -= double.parse(foodList[index].carbohydratesTotalG.toString());
    fat -= double.parse(foodList[index].fatTotalG.toString());
    print(cal);
    foodList.removeAt(index);
    notifyListeners();
  }

  clearFoodList() {
    foodList.clear();
    notifyListeners();
  }

  sendButtonName(int index) {
    buttonName = index;
  }
}
