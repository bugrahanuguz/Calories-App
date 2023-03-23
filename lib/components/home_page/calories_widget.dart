import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/search_view_model.dart';

class CaloriesWidget extends StatelessWidget {
  const CaloriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double protein = context.watch<SearchViewModel>().protein;
    double carb = context.watch<SearchViewModel>().carb;
    double fat = context.watch<SearchViewModel>().fat;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[0]),
                Text("${protein.toInt()}g"),
              ],
            ),
            context),
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[1]),
                Text("${carb.toInt()}g"),
              ],
            ),
            context),
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[2]),
                Text("${fat.toInt()}g"),
              ],
            ),
            context)
      ],
    );
  }
}

Widget _container(Widget child, BuildContext context) => Container(
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.height * 0.055,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );

List nutritionsValue = ["Protein", "Carbs", "Fat"];
