import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:softito_final_project/viewmodel/search_view_model.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    var cal = Provider.of<SearchViewModel>(context, listen: false);

    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: new CircularPercentIndicator(
        radius: 95.0,
        lineWidth: 20.0,
        percent: 1,
        center: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("${cal.totalCal.toInt()} kcal"),
            Icon(Icons.bolt_rounded)
          ],
        ),
        progressColor: Color(0xffC92C6D),
      ),
    );
  }
}
