import 'dart:convert';
import 'package:softito_final_project/const_files/const_variable.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:http/http.dart' as http;

String _userApi = ConstVariable.firebase_user_api;

class UserService {
  Uri getUrl(String endpoint) => Uri.parse("$_userApi/$endpoint.json");

  Future<List<UserModel>> getUsers() async {
    http.Response response = await http.get(getUrl("users"));
    List<UserModel> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      for (var key in data.keys) {
        UserModel user = UserModel.fromMap(data[key]);
        user.id = key;
        list.add(user);
        print(user);
      }
    }
    return list;
  }

  Future<UserModel?> postUser(UserModel user) async {
    http.Response response = await http.post(getUrl("users"),
        body: user.toJson(), headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      user.id = data["name"];
      return user;
    } else {
      return null;
    }
  }
}
