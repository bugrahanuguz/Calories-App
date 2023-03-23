import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:softito_final_project/views/reset_password_page.dart';

class ForgotPassword extends StatelessWidget {
  final String text;
  const ForgotPassword({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResetPassword()));
          },
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
