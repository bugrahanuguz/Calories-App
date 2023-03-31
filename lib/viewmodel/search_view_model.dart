import 'package:flutter/material.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/services/food_service.dart';

class SearchViewModel extends ChangeNotifier {
  FoodService foodService = FoodService();
  List food = [];
  List<Nutritions> foodList = [];
  double cal = 0;
  double bprotein = 0;
  double bcarb = 0;
  double bfat = 0;
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
  double protein = 0;
  double fat = 0;
  double carb = 0;
  double totalProtein = 0;
  double totalFat = 0;
  double totalCarb = 0;
  List<double> cal_meal = [];

  Future addFood(String txt) async {
    food.add(txt);
    notifyListeners();
  }

  Future getBreakfastCall(List<Nutritions> breakfast, List<Nutritions> lunch,
      List<Nutritions> dinner) async {
    print("breakFastCal");
    clearCal();

    for (var i = 0; i < breakfast.length; i++) {
      breakFastCal += breakfast[i].calories!;
      bprotein += breakfast[i].proteinG!;
      bfat += breakfast[i].fatTotalG!;
      bcarb += breakfast[i].carbohydratesTotalG!;
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
    totalProtein = bprotein + lprotein + dprotein;
    totalCarb = bcarb + lcarb + dcarb;
    totalFat = bfat + lfat + dfat;
    print(breakFastCal);
    print(lunch);
    print(dinner);
    print(totalCarb);
    print(totalFat);
    print(totalProtein);

    cal_meal = [breakFastCal, lunchCal, dinnerCal];
    print("breakFastCal");

    //notifyListeners();
    notifyListeners();
  }

  Future clearCal() async {
    cal = 0;
    bprotein = 0;
    bcarb = 0;
    bfat = 0;
    lprotein = 0;
    lcarb = 0;
    lfat = 0;
    dprotein = 0;
    dcarb = 0;
    dfat = 0;
    breakFastCal = 0;
    lunchCal = 0;
    dinnerCal = 0;
    totalCal = 0;
    protein = 0;
    fat = 0;
    carb = 0;
    totalProtein = 0;
    totalFat = 0;
    totalCarb = 0;
  }

  Future addFoodList(Nutritions nutrit, int index) async {
    foodList.add(nutrit);
    cal += double.parse(foodList[index].calories.toString());
    protein += double.parse(foodList[index].proteinG.toString());
    carb += double.parse(foodList[index].carbohydratesTotalG.toString());
    fat += double.parse(foodList[index].fatTotalG.toString());
    print(cal);
    notifyListeners();
  }

  Future removeFood(int index) async {
    cal -= double.parse(foodList[index].calories.toString());
    protein -= double.parse(foodList[index].proteinG.toString());
    carb -= double.parse(foodList[index].carbohydratesTotalG.toString());
    fat -= double.parse(foodList[index].fatTotalG.toString());
    print(cal);
    foodList.removeAt(index);
    notifyListeners();
  }

  Future clearFoodList() async {
    foodList.clear();
    notifyListeners();
  }

  Future sendButtonName(int index) async {
    buttonName = index;
    notifyListeners();
  }
}
