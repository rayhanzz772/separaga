import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:separaga/constants.dart';
import 'package:separaga/pages/badminton/bad_1.dart';
import 'package:separaga/pages/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool showProgress = false;
  final _auth = FirebaseAuth.instance;
  final TextEditingController namaController = new TextEditingController();
  final TextEditingController waktuController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  String? selectedValue; // Untuk menyimpan nilai yang dipilih
  final tempat = "Mitra Sport : Futsal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Booking'),
        backgroundColor: hijau, // Ganti dengan warna hijau yang Anda gunakan
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tempat: $tempat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Menambahkan beberapa TextFormField di sini
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama', // Label untuk input field
                border: OutlineInputBorder(), // Border input field
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  TextInputType.phone, // Keyboard type untuk nomor telepon
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              hint: Text("Lama Booking"),
              value:
                  selectedValue, // Nilai yang dipilih (dapat diatur atau diubah)
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue; // Update nilai yang dipilih
                });
              },
              items: <String>['1 Jam', '2 Jam', '3 Jam', '4 Jam'] // List opsi
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value), // Tampilkan nilai pada dropdown
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    hijau, // Ganti dengan warna hijau yang Anda gunakan
                minimumSize: Size(120, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() {
                  showProgress = true;
                });

                postDetailsToFirestore(selectedValue);
                _launchURL();
                Navigator.of(context).pop();
              },
              child: Text('Kirim Pesan'),
            ),
          ],
        ),
      ),
    );
  }

  postDetailsToFirestore(waktu) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref =
        FirebaseFirestore.instance.collection('booking_history');
    await ref.add({
      'phone': phoneController.text,
      'username': namaController.text,
      'waktu': waktu,
      'uid': user!.uid, // Menyimpan UID pengguna ke dalam Firestore
    });
  }

  _launchURL() async {
    var nama = namaController.text;
    var no = phoneController.text;
    var waktu = selectedValue;
    var message =
        '==== Booking ==== \nTempat : $tempat\nPembooking : $nama \nNo Telp : $no\nWaktu : $waktu';
    var encodedMessage = Uri.encodeFull(message);
    var url = 'https://wa.me/6289652616158?text=$encodedMessage';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
