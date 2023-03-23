import 'package:flutter/material.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:softito_final_project/services/food_service.dart';

class FoodViewModel extends ChangeNotifier {
  final FoodService services = FoodService();
  Nutritions? _food;
  Nutritions get food => _food!;
  UserModel? _currentUser;
  UserModel get currentFood => _currentUser!;

  setUser(Nutritions u) {
    _food = u;
    notifyListeners();
  }

  Future setFoods(Nutritions nutritions, UserModel currentUser) async {
    _currentUser = currentUser;
    Nutritions newFood = Nutritions(
        name: nutritions.name,
        calories: nutritions.calories,
        proteinG: nutritions.proteinG,
        carbohydratesTotalG: nutritions.carbohydratesTotalG,
        fatTotalG: nutritions.fatTotalG,
        servingSizeG: nutritions.servingSizeG);
    final response = await services.postFoods(newFood, currentUser);
    _food = response;
    notifyListeners();
  }
}
