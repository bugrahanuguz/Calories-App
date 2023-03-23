import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginGoogle extends StatelessWidget {
  final String imagePath;
  const LoginGoogle({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          imagePath,
          height: 42,
        ),
      ),
    );
  }
}
