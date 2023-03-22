import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:softito_final_project/models/nutritions_model.dart';
import 'package:softito_final_project/models/user_model.dart';
import 'package:softito_final_project/viewmodel/nutritions_view_model.dart';
import 'package:softito_final_project/viewmodel/users_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<NutritionViewModel>().getNutrition();
      context.read<UserViewModel>().getList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //UserModel user = context.watch<UserViewModel>().user;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: context.watch<NutritionViewModel>().nutrition_list.length,
          itemBuilder: (BuildContext context, int index) {
            Nutritions nutrit =
                context.watch<NutritionViewModel>().nutrition_list[index];
            UserModel user = context.watch<UserViewModel>().users[index];
            return Column(
              children: [
                Text(user.email.toString()),
                Text(nutrit.name.toString()),
                Text(nutrit.calories.toString()),
                TextButton(
                    onPressed: () async {
                      var provider = Provider.of<NutritionViewModel>(context,
                          listen: false);
                      await provider.getNutrition();
                    },
                    child: Text("Tıkla"))
              ],
            );
          },
        ),
      ),
    );
  }
}
