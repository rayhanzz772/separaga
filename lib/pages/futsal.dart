import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:separaga/constants.dart';
import 'package:separaga/pages/futsal/fut_1.dart';
import 'package:separaga/pages/login.dart';

import '../main.dart';

class Futsal extends StatelessWidget {
  const Futsal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: hijau, // Warna AppBar sesuai kebutuhan Anda
        toolbarHeight: 140,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "FUTSAL",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Spacer(), // Spacer untuk memberikan ruang kosong di tengah
                IconButton(
                  onPressed: () {
                    // Aksi ketika ikon notifikasi ditekan
                  },
                  icon: Icon(Icons.notifications),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Warna latar belakang field pencarian
                borderRadius: BorderRadius.circular(
                    8), // Mengatur border radius jika diinginkan
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari...', // Text hint pada field pencarian
                  border: InputBorder
                      .none, // Menghilangkan border dari field pencarian
                  icon: Icon(
                      Icons.search), // Icon pencarian di sebelah kiri field
                ),
                onChanged: (value) {
                  // Aksi ketika nilai field pencarian berubah
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border:
                    Border.all(color: const Color.fromARGB(255, 236, 236, 236)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Fut_1()), // Ganti dengan nama halaman Badminton Anda
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/lap futsal.jpeg'), // Ganti dengan path gambar Anda
                            fit: BoxFit
                                .cover, // Atur penyesuaian gambar sesuai kebutuhan
                          ),
                          borderRadius: BorderRadius.circular(
                              8), // Mengatur border radius untuk gambar jika diinginkan
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(),
                        Text("100K /lapangan /jam"),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "Mitra Sport : Futsal",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Tembalang, Semarang"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
