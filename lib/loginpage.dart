import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud_testing/sharing/textfieldSharing.dart';
import 'package:firebase_crud_testing/sharing/tombol.dart';
import 'package:flutter/material.dart';

class myloginpageCRUD extends StatefulWidget {
  myloginpageCRUD({super.key});

  @override
  State<myloginpageCRUD> createState() => _myloginpageCRUDState();
}

class _myloginpageCRUDState extends State<myloginpageCRUD> {
  //todo: buat Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //todo: Void logic buat tombol tekan sign IN
  void signUP() async {
    //todo: buat Indikator Loading pas masuk (ubah ke STATEFULL dulu baru work)
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    //todo: buat input email dan password ke firebase
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //todo: Indikator biar next page/tidak stuck
      //todo: hubungin indikator login page ke home page
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //todo: Indikator biar munculin nanti ada notif salah email dan passowrd
      Navigator.pop(context);
      if (e.code == 'Email tidak ada') {
        salahMyEmail();
      } else if (e.code == 'password tidak ada') {
        salahPassword();
      }
    }
  }

  //todo: Tampilin error salah Email
  void salahMyEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Email TIdak Tersedia'),
          );
        });
  }

  //todo: Tampilin error salah Password
  void salahPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password tidak cocok'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Icon(
                Icons.health_and_safety,
                size: 150,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'NDN E-HEALTH DATABASE',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.greenAccent),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  shareTextField(
                      ikon: Icon(Icons.mail),
                      HintTextMe: 'Email',
                      HideText: false,
                      controller: emailController),
                  SizedBox(
                    height: 20,
                  ),
                  shareTextField(
                      ikon: Icon(Icons.key),
                      HintTextMe: 'Password',
                      HideText: true,
                      controller: passwordController),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lupa Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            tombolSignIn(
              tekan: signUP,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'LOGIN WITH',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.lightGreen),
                      image: DecorationImage(
                          image: AssetImage('gambar/gugel.png'))),
                ),
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.lightGreen),
                      image: DecorationImage(
                          image: AssetImage('gambar/android.png'))),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum daftar?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 3,
                ),
                Text('DAFTARKAN',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
