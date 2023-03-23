import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgotPassword extends StatelessWidget {
  final String text;
  const ForgotPassword({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Forgot password?",
              style: TextStyle(color: Colors.grey[600]),
            ),
          )),
    );
  }
}
