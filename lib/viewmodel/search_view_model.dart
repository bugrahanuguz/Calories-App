import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  List food = [];

  addFood(String txt) {
    food.add(txt);
    notifyListeners();
  }
  removeFood(int index){
    food.removeAt(index);
    notifyListeners();
  }
  
}
