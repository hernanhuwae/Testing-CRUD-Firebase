import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud_testing/loginpage.dart';
import 'package:firebase_crud_testing/myhome.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //todo: Saat User Log In
        if (snapshot.hasData) {
          return MyHomePage();

          //todo:saat User tidak Log In
        } else {
          return myloginpageCRUD();
        }
      },
    ));
  }
}
