import 'dart:convert';
import 'dart:math';

import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:http/http.dart' as http;

const String _baseUrl =
    "https://api.calorieninjas.com/v1/nutrition?query=onion and melon";

class NutritionService {
  Uri getUrl() => Uri.parse(_baseUrl);

  Future<List<Nutritions>> getNutritions() async {
    http.Response response = await http.get(getUrl(),
        headers: {"X-Api-Key": "MnaqoBUOAQeyyzQilMymlw==stpvb00lNvVa39LL"});
    List<Nutritions> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body)['items'] as List;
      //print(data);
      // for (int i = 0; i < data['items'].length; i++) {
      //   Nutritions nutrition = Nutritions.fromMap(data['items'][i]);

      //   print(nutrition);
      // }
      data.forEach((nData) {
        Nutritions nutrition = Nutritions.fromMap(nData);
        // for (var k in data[i].keys) {
        //   print(nutrition);
        // }
        list.add(nutrition);
        list.forEach((element) {
          print(element);
        });
        //print(food);
      });
    }
    return list;
  }
}
