import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrContinueWith extends StatelessWidget {
  final String text;
  const OrContinueWith({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
