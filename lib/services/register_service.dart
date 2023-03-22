import 'dart:convert';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  String _baseUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=";
  String apiKey = "";
  Uri getUrl() => Uri.parse("$_baseUrl$apiKey");
  bool _isRegister = false;
  bool get isRegister => _isRegister;

  Future<UserModel?> signUser(UserModel user) async {
    http.Response response = await http.post(getUrl(),
        body: user.toJson(), headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      user.id = data["localId"];
      _isRegister = true;
      print(data);
      return user;
    } else {
      return user;
    }
  }
}
