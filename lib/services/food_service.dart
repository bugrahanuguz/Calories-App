import 'dart:convert';
import 'package:softito_final_project/const_files/const_variable.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:http/http.dart' as http;

String _foodApi = ConstVariable.firebase_user_api;

class FoodService {
  Uri getUrl(String endpoint) => Uri.parse("$_foodApi/$endpoint/foods.json");

  Future<List<Nutritions>> getFoods() async {
    http.Response response = await http.get(getUrl("foods"));
    List<Nutritions> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      for (var key in data.keys) {
        Nutritions user = Nutritions.fromMap(data[key]);
        user.name = key;
        list.add(user);
      }
    }
    return list;
  }

  Future<Nutritions?> postFoods(Nutritions food, UserModel users) async {
    http.Response response = await http.post(getUrl("users/${users.id}"),
        body: food.toJson(), headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return food;
    } else {
      return null;
    }
  }
}
