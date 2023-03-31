import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../const_files/const_variable.dart';

class ChangeMealName extends StatelessWidget {
  const ChangeMealName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.only(left: 10),
          width: ConstVariable(context).screenWidth * 0.6,
          child: TextField(
              controller: TextEditingController(text: "Other"),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset(
                    "assets/images/pen.png",
                    scale: 3,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
