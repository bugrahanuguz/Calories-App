import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/nutritions_model.dart';
import '../models/user_model.dart';
import '../viewmodel/nutritions_view_model.dart';
import '../viewmodel/users_view_model.dart';

class NutritionListWidget extends StatelessWidget {
  const NutritionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  var provider =
                      Provider.of<NutritionViewModel>(context, listen: false);
                  await provider.getNutrition();
                },
                child: Text("Tıkla"))
          ],
        );
      },
    );
  }
}
