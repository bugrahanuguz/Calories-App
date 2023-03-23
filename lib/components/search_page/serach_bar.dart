import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            border: InputBorder.none,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/images/search.png",
                scale: 3,
              ),
            ),
          )),
    );
  }
}
