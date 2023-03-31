import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  final String text;
  final Function()? ontap;
  const HaveAccount({super.key, required this.text, this.ontap});

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
