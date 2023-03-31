import 'package:flutter/material.dart';
import 'package:softito_final_project/services/register_service.dart';
import '../models/user_model.dart';
import '../services/login_service.dart';
import '../views/home_page.dart';

class LoginViewModel extends ChangeNotifier {
  final _service = LoginService();
  final _service2 = RegisterService();
  List<UserModel> _users = [];
  List<UserModel> get users => _users;
  UserModel? _user;
  UserModel get user => _user!;
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  bool _isRegister = false;
  bool get isRegister => _isRegister;
  String? _localId;
  String get localId => _localId!;

  setLocalId(String localId) {
    _localId = localId;
  }

  setRegister(bool value) {
    _isRegister = value;
    notifyListeners();
  }

  Future login(String email, String password) async {
    UserModel newUser = UserModel(email: email, password: password);
    final response = await _service.postUser(newUser);
    _user = response;
    _isLogin = _service.isLogin;
    notifyListeners();
  }

  Future signUp(String email, String password) async {
    UserModel newUser = UserModel(email: email, password: password);
    final response = await _service2.signUser(newUser);
    _user = response;
    _isRegister = _service2.isRegister;
    notifyListeners();
  }

  Future delay(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));

    notifyListeners();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    notifyListeners();
  }
}
