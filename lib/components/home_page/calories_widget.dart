import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/foods_view_model.dart';
import '../../viewmodel/search_view_model.dart';

class CaloriesWidget extends StatelessWidget {
  const CaloriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<SearchViewModel>(context, listen: false);
    var prov = Provider.of<FoodViewModel>(context, listen: false);
    //p.clearCal();
    //p.getBreakfastCall(prov.breakfast, prov.lunch, prov.dinner);
    double protein = context.read<SearchViewModel>().totalProtein;
    double carb = context.read<SearchViewModel>().totalCarb;
    double fat = context.read<SearchViewModel>().totalFat;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _container(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nutritionsValue[0],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${p.totalProtein.toInt()} g"),
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
