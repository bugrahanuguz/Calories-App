import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softito_final_project/models/reset_password.dart';

import '../const_files/const_variable.dart';

class ResetPasswordService {
  bool _isSended = false;
  bool get isSended => _isSended;
  String _baseUrl =
      ('https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=');
  String requestType = ('PASSWORD_RESET');
  String apiKey = ConstVariable.firebase_api_key;
  Uri getUrl() => Uri.parse("$_baseUrl$apiKey");
  Future<String?> resetPasswordFunc(
      ResetPasswordModel resetPasswordModel) async {
    http.Response response = await http.post(getUrl(),
        body: resetPasswordModel.toJson(),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      var data = json.decode(response.body)["email"];
      _isSended = true;

      return data;
    } else {
      return null;
    }
  }
}
