import 'package:flutter/material.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/services/food_service.dart';

class SearchViewModel extends ChangeNotifier {
  FoodService foodService = FoodService();
  List food = [];
  List<Nutritions> foodList = [];
  double cal = 0;
  double protein = 0;
  double carb = 0;
  double fat = 0;
  int buttonName = 0;
  double breakFastCal = 0;
  double lunchCal = 0;
  double dinnerCal = 0;
  double totalCal = 0;

  addFood(String txt) {
    food.add(txt);
    notifyListeners();
  }

  getBreakfastCall(List<Nutritions> breakfast, List<Nutritions> lunch,
      List<Nutritions> dinner) {
    print("breakFastCal");
    for (var i = 0; i < breakfast.length; i++) {
      breakFastCal += breakfast[i].calories!;
    }
    for (var i = 0; i < lunch.length; i++) {
      lunchCal += lunch[i].calories!;
    }
    for (var i = 0; i < dinner.length; i++) {
      dinnerCal += dinner[i].calories!;
    }
    totalCal = dinnerCal + lunchCal + breakFastCal;
    print(breakFastCal);
    print(lunch);
    print(dinner);

    print("breakFastCal");

    notifyListeners();
  }

  clearCal() {
    breakFastCal = 0;
    lunchCal = 0;
    dinnerCal = 0;
    totalCal = 0;
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
