import 'package:flutter/material.dart';

const kuning = Color(0xffF4F1DA);
const merah = Color(0xfff4d4d4);
const pink = Color(0xfff4dad0);
const biru = Color(0xffC1Daeb);
const hijau = Color(0xff1E552E);
const abuz = Color(0xd9d9d9);
const hijauterang = Color.fromARGB(255, 145, 234, 170);

const kPrimaryColor = Color.fromRGBO(66, 187, 255, 1);
const kPrimaryLightColor = Color.fromARGB(255, 237, 237, 237);
const kBackgroundColor = Color.fromRGBO(255, 240, 239, 239);
const black = Color.fromRGBO(44, 44, 44, 1);
const double defaultPadding = 16.0;

class AppBoxShadows {
  static final boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 1,
    offset: Offset(0.9, 0.9),
  );

  // Jika Anda membutuhkan box shadow lain, tambahkan di sini
}
