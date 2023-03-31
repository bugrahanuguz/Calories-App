import 'dart:convert';
import 'package:softito_final_project/const_files/const_variable.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:http/http.dart' as http;

String _foodApi = ConstVariable.firebase_user_api;

class FoodService {
  Uri getUrl(String endpoint) => Uri.parse("$_foodApi/$endpoint.json");

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

  Future<List<Nutritions>> getBreakfast(UserModel user) async {
    http.Response response =
        await http.get(getUrl("users/${user.id}/foods/breakfast"));
    List<Nutritions> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      print(data);
      for (var key in data.keys) {
        Nutritions nut = Nutritions.fromMap(data[key]);
        list.add(nut);
      }

      print("----------");
      print(list);
    }
    return list;
  }

  Future<List<Nutritions>> getDinner(UserModel user) async {
    http.Response response =
        await http.get(getUrl("users/${user.id}/foods/dinner"));
    List<Nutritions> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      print(data);
      for (var key in data.keys) {
        Nutritions nut = Nutritions.fromMap(data[key]);
        list.add(nut);
      }
      print("----------");
      print(list);
    }
    return list;
  }

  Future<List<Nutritions>> getLunch(UserModel user) async {
    http.Response response =
        await http.get(getUrl("users/${user.id}/foods/lunch"));
    List<Nutritions> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      print(data);
      for (var key in data.keys) {
        Nutritions nut = Nutritions.fromMap(data[key]);
        list.add(nut);
      }
      print("----------");
      print(list);
    }
    return list;
  }

  // Future<Nutritions?> postFoods(Nutritions food, UserModel users) async {
  //   http.Response response = await http.post(getUrl("users/${users.id}"),
  //       body: food.toJson(), headers: {"Content-Type": "application/json"});
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return food;
  //   } else {
  //     return null;
  //   }
  // }

  Future<Nutritions?> postBreakfast(Nutritions food, UserModel users) async {
    http.Response response = await http.post(
        getUrl("users/${users.id}/foods/breakfast"),
        body: food.toJson(),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      getBreakfast(users);
      return food;
    } else {
      return null;
    }
  }

  Future<Nutritions?> postLunch(Nutritions food, UserModel users) async {
    http.Response response = await http.post(
        getUrl("users/${users.id}/foods/lunch"),
        body: food.toJson(),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      getLunch(users);

      return food;
    } else {
      return null;
    }
  }

  Future<Nutritions?> postDinner(Nutritions food, UserModel users) async {
    http.Response response = await http.post(
        getUrl("users/${users.id}/foods/dinner"),
        body: food.toJson(),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      getDinner(users);

      return food;
    } else {
      return null;
    }
  }
}
