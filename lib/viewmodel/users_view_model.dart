import 'package:flutter/material.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:softito_final_project/services/user_service.dart';

class UserViewModel extends ChangeNotifier {
  final UserService services = UserService();
  List<UserModel> _users = [];
  List<UserModel> get users => _users;
  UserModel? _user;
  UserModel get user => _user!;

  setUser(UserModel u) {
    _user = u;
    notifyListeners();
  }

  Future getList() async {
    final response = await services.getUsers();
    _users = response;
    notifyListeners();
  }
}
