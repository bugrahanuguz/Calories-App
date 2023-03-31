import 'dart:convert';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:softito_final_project/const_files/const_variable.dart';

class LoginService {
  String _firebaseloginUrl = ConstVariable.firebase_login_api;

  String apiKey = ConstVariable.firebase_api_key;
  Uri getUrl() => Uri.parse("$_firebaseloginUrl$apiKey");

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future<UserModel?> postUser(UserModel user) async {
    http.Response response = await http.post(getUrl(),
        body: user.toJson(), headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      user.id = data["localId"];
      _isLogin = true;
      print(user.id);
      return user;
    } else {
      return user;
    }
  }
}
