import 'package:flutter/material.dart';

class  ConstVariable{


  //firebase user api


  static String firebase_user_api = "https://test-project-cc38e-default-rtdb.europe-west1.firebasedatabase.app";
  //login register api
  static String firebase_login_api = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=";

  static String firebase_register_api = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=";

  static String firebase_api_key = "AIzaSyCjZEsHcXVg-q679J-2prcl58aLbAtlw3w";

  //nutritions api
  static String nutritions_api = "https://api.calorieninjas.com/v1/nutrition?query=onion and melon and chicken salad";

  static String nutritions_api_key = "MnaqoBUOAQeyyzQilMymlw==stpvb00lNvVa39LL";

  // screen size and width

  final BuildContext context;
  ConstVariable(this.context);
  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;



}