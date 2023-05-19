import 'package:flutter/material.dart';

class shareTextField extends StatelessWidget {
  final String HintTextMe;
  final controller;
  final Icon ikon;
  final bool HideText;
  const shareTextField(
      {super.key,
      required this.HintTextMe,
      required this.ikon,
      required this.HideText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: HideText,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: ikon,
          hintText: HintTextMe,
          hintStyle: TextStyle(fontSize: 15, color: Colors.brown),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent)),
          fillColor: Colors.grey.shade300,
          filled: true),
    );
  }
}
