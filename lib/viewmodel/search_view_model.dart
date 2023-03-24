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
  double lprotein = 0;
  double lcarb = 0;
  double lfat = 0;
  double dprotein = 0;
  double dcarb = 0;
  double dfat = 0;
  int buttonName = 0;
  double breakFastCal = 0;
  double lunchCal = 0;
  double dinnerCal = 0;
  double totalCal = 0;

  double total_protein = 0;
  double total_fat = 0;
  double total_carb = 0;
  List<double> cal_meal = [];

  addFood(String txt) {
    food.add(txt);
    notifyListeners();
  }

  Future getBreakfastCall(List<Nutritions> breakfast, List<Nutritions> lunch,
      List<Nutritions> dinner) async {
    print("breakFastCal");
    for (var i = 0; i < breakfast.length; i++) {
      breakFastCal += breakfast[i].calories!;
      protein += breakfast[i].proteinG!;
      fat += breakfast[i].fatTotalG!;
      carb += breakfast[i].carbohydratesTotalG!;
    }
    for (var i = 0; i < lunch.length; i++) {
      lunchCal += lunch[i].calories!;
      lprotein += lunch[i].proteinG!;
      lfat += lunch[i].fatTotalG!;
      lcarb += lunch[i].carbohydratesTotalG!;
    }
    for (var i = 0; i < dinner.length; i++) {
      dinnerCal += dinner[i].calories!;
      dprotein += dinner[i].proteinG!;
      dfat += dinner[i].fatTotalG!;
      dcarb += dinner[i].carbohydratesTotalG!;
    }

    totalCal = dinnerCal + lunchCal + breakFastCal;
    total_protein = protein + lprotein + lfat;
    total_carb = carb + lcarb + dcarb;
    total_fat = fat + lfat + dfat;
    notifyListeners();
    print(breakFastCal);
    print(lunch);
    print(dinner);
    print(total_carb);
    print(total_fat);
    print(total_protein);

    cal_meal = [breakFastCal, lunchCal, dinnerCal];
    print("breakFastCal");

    notifyListeners();
  }

  clearCal() {
    breakFastCal = 0;
    lunchCal = 0;
    dinnerCal = 0;
    totalCal = 0;
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
    notifyListeners();
  }
}
