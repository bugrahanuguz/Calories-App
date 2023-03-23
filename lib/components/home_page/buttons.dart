import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/homepage_view_model.dart';

class HomePageButtons extends StatelessWidget {
  const HomePageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, right: 30),
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          context.read<HomepageViewModel>().addMeal();
        },
        child: Text("ADD MEAL"),
        style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(150, 40)),
            backgroundColor: MaterialStatePropertyAll(Colors.purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ))),
      ),
    );
  }
}
