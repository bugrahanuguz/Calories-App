import 'dart:convert';
import 'package:softito_final_project/const_files/const_variable.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:http/http.dart' as http;

class NutritionService {
  String _nutritionsUrl = ConstVariable.nutritions_api;

  Future<List<Nutritions>> getNutritions(String query) async {
    Uri getUrl() => Uri.parse(_nutritionsUrl + query);
    http.Response response = await http.get(getUrl(),
        headers: {"X-Api-Key": ConstVariable.nutritions_api_key});
    List<Nutritions> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body)['items'] as List;
      data.forEach((nData) {
        Nutritions nutrition = Nutritions.fromMap(nData);
        list.add(nutrition);
        list.forEach((element) {
          print(element);
        });
      });
    }
    return list;
  }
}
