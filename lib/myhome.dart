import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  //todo: fungsi untuk keluar ke halaman login lagi setelah log in dan data masuk ke Firebase
  void signToOut() {
    FirebaseAuth.instance.signOut();
  }

  //todo: Munculin data email dari Firebase
  final pengguna = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signToOut, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Text('TEST DATABASE NDN E-HEALTH Log In: ' + pengguna.email!),
      ),
    );
  }
}
