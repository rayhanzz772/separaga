import 'package:flutter/material.dart';
import 'package:separaga/constants.dart';
import 'package:separaga/pages/basket/booking.dart';

class Bas_1 extends StatelessWidget {
  const Bas_1({super.key});

  final tempat = "Mitra Sport : Basket";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Tempat'),
        backgroundColor: hijau,
      ),
      body: Container(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image(
                  image: AssetImage('assets/images/lap basket.jpeg'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "$tempat",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Rp. 80000 / jam",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 16)),
                  Text(
                    "Desa Wonolopo, Mijen, Kota Semarang",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "INFORMASI",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Maksimal booking 3 jam per lapangan. Untuk pemesanan yang akan digunakan untuk suatu event dapat menghubungi ke nomer WhatsApp 082145288201. Karena akan terdapat biaya tambahan untuk kegiatan event.",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Text("Fasilitas tempat :"),
                    Text("  - Toilet"),
                    Text("  - Parkir Luas"),
                    Text("  - Wifi"),
                    Text("  - Kantin"),
                    SizedBox(height: 10),
                    Text("Senin - Jumat          06.00 - 22.00"),
                    Text("Sabtu & Minggu      06.00 - 00.00"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Memanggil fungsi untuk navigasi ke halaman booking
                  navi(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: hijau,
                  minimumSize: Size(120, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Booking sekarang'),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi navi untuk navigasi ke halaman booking
  void navi(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookingPage()),
    );
  }
}
