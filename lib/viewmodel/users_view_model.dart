import 'package:flutter/material.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:softito_final_project/services/user_service.dart';

class UserViewModel extends ChangeNotifier {
  final UserService services = UserService();
  List<Nutritions> _users = [];
  List<Nutritions> get users => _users;
  Nutritions? _user;
  Nutritions get user => _user!;
  UserModel? _currentUser;
  UserModel get currentUser => _currentUser!;

  setUser(Nutritions u) {
    _user = u;
    notifyListeners();
  }

  Future setList(Nutritions nutritions, UserModel currentUser) async {
    _currentUser = currentUser;
    Nutritions newUser = Nutritions(
        name: nutritions.name,
        calories: nutritions.calories,
        proteinG: nutritions.proteinG,
        carbohydratesTotalG: nutritions.carbohydratesTotalG,
        fatTotalG: nutritions.fatTotalG,
        servingSizeG: nutritions.servingSizeG);
    final response = await services.postUser(newUser, currentUser);
    _user = response;
    notifyListeners();
  }
}
