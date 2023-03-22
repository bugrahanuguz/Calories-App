import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:softito_final_project/services/nutritions_service.dart';

import '../models/nutritions_model.dart';

class NutritionViewModel extends ChangeNotifier {
  final _service = NutritionService();
  List<Nutritions> _nutrition_list = [];
  List<Nutritions> get nutrition_list => _nutrition_list;

  Future<void> getNutrition() async {
    final response = await _service.getNutritions();
    _nutrition_list = response;
    notifyListeners();
  }
}
