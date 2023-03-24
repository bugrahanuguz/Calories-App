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
                Text(
                  nutritionsValue[0],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${protein.toInt()} g"),
              ],
            ),
            context,
            protein.toInt()),
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[1],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${carb.toInt()} g"),
              ],
            ),
            context,
            carb.toInt()),
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[2],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${fat.toInt()} g"),
              ],
            ),
            context,
            fat.toInt())
      ],
    );
  }
}

Widget _container(Widget child, BuildContext context, int val) => Container(
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.height * 0.055,
      decoration: BoxDecoration(
        color: val < 100 ? Colors.grey.shade200 : Colors.purple,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );

List nutritionsValue = ["Protein", "Carbs", "Fat"];
