import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CaloriesWidget extends StatelessWidget {
  const CaloriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[0]),
                Text("30%"),
              ],
            ),
            context),
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[1]),
                Text("30%"),
              ],
            ),
            context),
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nutritionsValue[2]),
                Text("30%"),
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
