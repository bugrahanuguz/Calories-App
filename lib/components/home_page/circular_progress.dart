import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    double cal = context.watch<SearchViewModel>().cal;
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: new CircularPercentIndicator(
        radius: 95.0,
        lineWidth: 20.0,
        percent: cal < 1000 ? cal / 1000 : 1,
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [new Text("${cal.toInt()} kcal"), Icon(Icons.bolt_rounded)],
        ),
        progressColor: Color(0xffC92C6D),
      ),
    );
  }
}
