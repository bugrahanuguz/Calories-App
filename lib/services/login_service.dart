import 'dart:convert';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  String _baseUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=";

  String apiKey = "AIzaSyCjZEsHcXVg-q679J-2prcl58aLbAtlw3w";
  Uri getUrl() => Uri.parse("$_baseUrl$apiKey");
  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future<UserModel?> postUser(UserModel user) async {
    http.Response response = await http.post(getUrl(),
        body: user.toJson(), headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      user.id = data["localId"];
      _isLogin = true;
      print(data);
      return user;
    } else {
      return user;
    }
  }
}
