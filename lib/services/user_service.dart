import 'dart:convert';

import 'package:softito_final_project/models/user_model.dart';
import 'package:http/http.dart' as http;

const String _baseUrl =
    "https://test-project-cc38e-default-rtdb.europe-west1.firebasedatabase.app";

class UserService {
  Uri getUrl(String endpoint) => Uri.parse("$_baseUrl/$endpoint.json");

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
}
