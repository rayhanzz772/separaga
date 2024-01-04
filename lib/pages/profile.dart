import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:separaga/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance;
  bool showProgress = false;
  String phone = '';
  String nama = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: hijau, // Warna AppBar sesuai kebutuhan Anda
          toolbarHeight: 80,
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
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //
              //
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where('uid', isEqualTo: currentUser.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Menampilkan indikator loading jika data masih dimuat
                  } else if (snapshot.hasError) {
                    return Text(
                        'Error: ${snapshot.error}'); // Menampilkan pesan error jika terjadi kesalahan
                  } else {
                    List<Widget> clientWidgets =
                        []; // List untuk menampung widget yang akan ditampilkan
                    final clients = snapshot.data?.docs.toList();

                    if (clients != null) {
                      for (var complaintHistory in clients) {
                        // Ubah bagian ini sesuai dengan struktur data di Firestore Anda
                        nama = complaintHistory['username'];
                        email = complaintHistory['email'];
                        phone = complaintHistory['phone'];
                        // Tambahkan widget ke dalam list clientWidgets
                        clientWidgets.add(Row(
                          children: [],
                        ));
                      }
                    }

                    return Row(
                      children:
                          clientWidgets, // Tampilkan widget yang telah ditambahkan ke dalam Column
                    );
                  }
                },
              ),
              //
              //
              //
              //
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(0),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                // ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "PROFILE",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 18, right: 18, top: 25),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // PATIENT COMPLAINT
                      //
                      //
                      Text(
                        "Nama",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        // <-- TextField height
                        child: TextFormField(
                          enabled: false,
                          // controller: tension,
                          maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '$nama',
                          ),
                          // onSaved: (value) {
                          //   tension.text = value!;
                          // },
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //
                      //
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        // <-- TextField height
                        child: TextFormField(
                          enabled: false,

                          // controller: pulse,
                          maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '$email',
                          ),
                          // onSaved: (value) {
                          //   pulse.text = value!;
                          // },
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //
                      //
                      //
                      //
                      //
                      Text(
                        "Phone",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        // <-- TextField height
                        child: TextFormField(
                          enabled: false,
                          maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '$phone',
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //
                      //
                      //
                      //
                      //

                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 40,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            color: hijau,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 40,
                            onPressed: () {
                              setState(() {
                                showProgress = true;
                              });
                            },
                            child: Text(
                              "Reload",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            color: hijau,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
