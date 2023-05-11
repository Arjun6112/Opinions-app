import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  const CustomTF(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText});
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: Colors.deepOrange[300],
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepOrange.shade300, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepOrange.shade300, width: 3)),
            hintText: hintText,
          )),
    );
  }
}
