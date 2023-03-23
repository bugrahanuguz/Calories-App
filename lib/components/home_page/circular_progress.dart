import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: new CircularPercentIndicator(
        radius: 95.0,
        lineWidth: 20.0,
        percent: 0.50,
        center: new Text("50%"),
        progressColor: Colors.purple,
      ),
    );
  }
}
