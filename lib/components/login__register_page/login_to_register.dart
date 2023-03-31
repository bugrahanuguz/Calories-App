import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginToRegister extends StatelessWidget {
  final Function()? ontap;
  const LoginToRegister({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Not a member?",
        ),
        const SizedBox(width: 4),
        TextButton(
            onPressed: ontap,
            child: Text(
              "Register here",
              style: TextStyle(
                  color: Color(0xffC92C6D), fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
