import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:separaga/constants.dart';
import 'package:separaga/pages/badminton.dart';
import 'package:separaga/pages/basket.dart';
import 'package:separaga/pages/futsal.dart';
import 'package:separaga/pages/history.dart';
import 'package:separaga/pages/login.dart';
import 'package:separaga/pages/profile.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  final String userEmail;

  const HomePage(this.userEmail, {super.key});

  @override
  Widget build(BuildContext context) {
    String trimmedEmail = userEmail.split('@').first;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: hijau, // Warna AppBar sesuai kebutuhan Anda
        toolbarHeight: 160,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo_putih.png',
                  width: 90,
                ),
                SizedBox(height: 14),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Aksi ketika ikon notifikasi ditekan
                      },
                      icon: Icon(Icons.notifications),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $trimmedEmail !', // Teks sambutan atau ucapan
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Olahraga apa yang akan kamu lakukan?',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.blue, // Warna border yang diinginkan
        //     width: 2.0, // Lebar border
        //   ),
        // ),
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Pilih Olahraga",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Badminton()), // Ganti dengan nama halaman Badminton Anda
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/badminton.png'), // Ganti dengan path gambar Anda
                          fit: BoxFit
                              .cover, // Atur penyesuaian gambar sesuai kebutuhan
                        ),
                        borderRadius: BorderRadius.circular(
                            8), // Mengatur border radius untuk gambar jika diinginkan
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "BULU TANGKIS",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Basket()), // Ganti dengan nama halaman Badminton Anda
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/basket.png'), // Ganti dengan path gambar Anda
                          fit: BoxFit
                              .cover, // Atur penyesuaian gambar sesuai kebutuhan
                        ),
                        borderRadius: BorderRadius.circular(
                            8), // Mengatur border radius untuk gambar jika diinginkan
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "BASKET",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Futsal()), // Ganti dengan nama halaman Badminton Anda
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/futsal.png'), // Ganti dengan path gambar Anda
                          fit: BoxFit
                              .cover, // Atur penyesuaian gambar sesuai kebutuhan
                        ),
                        borderRadius: BorderRadius.circular(
                            8), // Mengatur border radius untuk gambar jika diinginkan
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "FUTSAL",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  icon: Icon(Icons.logout), // Ikon untuk menu "Home"
                  iconSize: 70, // Mengatur ukuran ikon
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              History()), // Ganti dengan nama halaman Badminton Anda
                    );
                  },
                  icon: Icon(Icons.history), // Ikon untuk menu "History"
                  iconSize: 70, // Mengatur ukuran ikon
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Profile()), // Ganti dengan nama halaman Badminton Anda
                    );
                  },
                  icon: Icon(Icons.person), // Ikon untuk menu "Profile"
                  iconSize: 70, // Mengatur ukuran ikon
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
