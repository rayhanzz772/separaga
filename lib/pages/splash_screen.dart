import 'dart:async';

import 'package:flutter/material.dart';
import 'package:separaga/pages/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay untuk simulasi splash screen selama 3 detik
    Timer(Duration(seconds: 3), () {
      // Navigasi ke halaman selanjutnya setelah splash screen selesai
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan logo atau elemen lainnya di sini
            SizedBox(height: 20),
            Image.asset(
              "assets/images/login_logo.png",
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
