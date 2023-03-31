import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:softito_final_project/views/reset_password_page.dart';

class ForgotPassword extends StatelessWidget {
  final String text;
  final Function()? ontap;
  const ForgotPassword({super.key, required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: ontap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[600]),
            ),
          )),
    );
  }
}
// () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => ResetPassword()));
//           }