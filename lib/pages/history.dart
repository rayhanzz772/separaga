import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:separaga/constants.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
                          setState(() {
                            showProgress = true;
                          });
                        },
                        icon: Icon(Icons.refresh),
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
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(0),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                // ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.history),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "HISTORY",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //
              //
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("booking_history")
                    .where('uid', isEqualTo: currentUser.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final List<DocumentSnapshot> historyList =
                        snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: historyList.length,
                      itemBuilder: (context, index) {
                        String nama = historyList[index]['username'];
                        String phone = historyList[index]['phone'];
                        String waktu = historyList[index]['waktu'];

                        return Card(
                          elevation: 2,
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama: $nama',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text('Phone: $phone'),
                                SizedBox(height: 8),
                                Text('Waktu: $waktu'),
                                // Add other fields as needed
                              ],
                            ),
                          ),
                        );
                      },
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
                padding: EdgeInsets.only(left: 18, right: 18, top: 25),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
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
