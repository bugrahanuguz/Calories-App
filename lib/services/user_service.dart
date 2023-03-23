import 'dart:convert';
import 'package:softito_final_project/const_files/const_variable.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:http/http.dart' as http;

String _userApi = ConstVariable.firebase_user_api;

class UserService {
  Uri getUrl(String endpoint) => Uri.parse("$_userApi/$endpoint/sadsa.json");

  Future<List<Nutritions>> getFoods() async {
    http.Response response = await http.get(getUrl("foods"));
    List<Nutritions> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      for (var key in data.keys) {
        Nutritions user = Nutritions.fromMap(data[key]);
        user.name = key;
        list.add(user);
        print(user);
      }
    }
    return list;
  }

  Future<Nutritions?> postUser(Nutritions user, UserModel users) async {
    http.Response response = await http.post(getUrl("users/${users.id}"),
        body: user.toJson(), headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      //user.name = data["name"];
      return user;
    } else {
      return null;
    }
  }
}
