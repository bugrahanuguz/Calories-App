import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';

import '../../viewmodel/foods_view_model.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<FoodViewModel>(context);

    context
        .read<SearchViewModel>()
        .getBreakfastCall(prov.breakfast, prov.lunch, prov.dinner);
    //var cal = Provider.of<SearchViewModel>(context, listen: false);
    //double cal = context.read<SearchViewModel>().totalCal;
    // print(context.read<SearchViewModel>().totalCal);
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: CircularPercentIndicator(
        radius: 95.0,
        lineWidth: 20.0,
        percent: context.read<SearchViewModel>().totalCal < 3000
            ? context.read<SearchViewModel>().totalCal / 3000
            : 1,
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${context.read<SearchViewModel>().totalCal} kcal"),
            Icon(Icons.bolt_rounded)
          ],
        ),
        progressColor: Color(0xffC92C6D),
      ),
    );
  }
}
