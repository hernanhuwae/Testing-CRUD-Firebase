import 'package:flutter/material.dart';

class tombolSignIn extends StatelessWidget {
  final Function()? tekan;
  const tombolSignIn({super.key, required this.tekan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tekan,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(color: Colors.green),
        child: Center(
            child: Text(
          'LOGIN',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        )),
      ),
    );
  }
}
