import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu/model/daftar.dart';
import 'package:menu/service/firestore_service.dart';
import 'package:menu/service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class detailPopuler extends StatefulWidget {
  final Map<String, dynamic> isiPopuler;

  detailPopuler({required this.isiPopuler});

  @override
  State<detailPopuler> createState() => _detailPopulerState();
}

final FirestoreService firestoreService = FirestoreService();
TextEditingController namaController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController komentarController = TextEditingController();

class _detailPopulerState extends State<detailPopuler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(31, 32, 38, 1),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 268,
                child: ClipRRect(
                  child: Image(
                      image: NetworkImage(widget.isiPopuler['gambar']),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                width: double.infinity,
                height: 268,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: 45,
                          width: 115,
                          child: Center(
                              child: Text(
                            '⭐5.0',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.amber, width: 2)),
                          height: 45,
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.isiPopuler['harga'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              Text(
                                "/ppl",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isiPopuler['nama_destinasi'],
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  widget.isiPopuler['lokasi'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  widget.isiPopuler['jarak'],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.isiPopuler['desc'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )
              ],
            ),
          ),
          
          komentar()
          
        ],
      ),
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
    );
  }
}

class detailTerbaru extends StatelessWidget {
  final Map<String, dynamic> isiTerbaru;

  detailTerbaru({required this.isiTerbaru});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(31, 32, 38, 1),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 268,
                child: ClipRRect(
                  child: Image(
                      image: NetworkImage(isiTerbaru['gambar']),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                width: double.infinity,
                height: 268,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: 45,
                          width: 115,
                          child: Center(
                              child: Text(
                            '⭐5.0',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.amber, width: 2)),
                          height: 45,
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isiTerbaru['harga'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              Text(
                                "/ppl",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isiTerbaru['nama_destinasi'],
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  isiTerbaru['lokasi'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  isiTerbaru['jarak'],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  isiTerbaru['desc'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )
              ],
            ),
          ),
          komentar()
        ],
      ),
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
    );
  }
}

class komentar extends StatefulWidget {
  const komentar({super.key});

  @override
  State<komentar> createState() => _komentarState();
}

class _komentarState extends State<komentar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => kategoriPopuler()));
                        // },
                        child: const Text(
                          "Komentar",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: Text(
                                  'Tambah Komentar',
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                                content: Column(
                                  children: [
                                    TextField(
                                        controller: namaController,
                                        decoration: InputDecoration(
                                            hintText: 'Nama',
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        255, 199, 0, 1)))),
                                        cursorColor: Color.fromRGBO(255, 199, 0, 1),
                                        style: TextStyle(color: Colors.white)),
                                    TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        255, 199, 0, 1)))),
                                        cursorColor: Color.fromRGBO(255, 199, 0, 1),
                                        style: TextStyle(color: Colors.white)),
                                    TextField(
                                        controller: komentarController,
                                        decoration: InputDecoration(
                                            hintText: 'Komentar',
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        255, 199, 0, 1)))),
                                        cursorColor: Color.fromRGBO(255, 199, 0, 1),
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Simpan data baru ke Firestore
                                      firestoreService.addKomentar(
                                        namaController.text,
                                        emailController.text,
                                        komentarController.text,
                                      );
                                      namaController.clear();
                                      emailController.clear();
                                      komentarController.clear();
                                      // Tutup dialog setelah data ditambahkan
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Simpan'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.control_point_duplicate_sharp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ]),
              ),
              StreamBuilder<QuerySnapshot>(
              stream: FirestoreService().getKomentar(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    List userList = snapshot.data!.docs;
                    return Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: userList.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot documentSnapshot = userList[index];
                          Map<String, dynamic> data =
                              documentSnapshot.data() as Map<String, dynamic>;
                          return Container(
                            margin: EdgeInsets.all(20),
                            width: 300,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 51, 23, 23),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['nama'],
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        data['email'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data['komentar'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors.black,
                                                  title: Text(
                                                    'Edit Komentar',
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  content: Column(
                                                    children: [
                                                      TextField(
                                                          controller:
                                                              komentarController,
                                                          decoration: InputDecoration(
                                                              hintText:
                                                                  'Komentar',
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromRGBO(
                                                                              255,
                                                                              199,
                                                                              0,
                                                                              1)))),
                                                          cursorColor:
                                                              Color.fromRGBO(
                                                                  255,
                                                                  199,
                                                                  0,
                                                                  1),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // Simpan data baru ke Firestore
                                                        firestoreService
                                                            .updateKomentar(
                                                          documentSnapshot.id,
                                                          komentarController
                                                              .text,
                                                        );
                                                        komentarController
                                                            .clear();
                                                        // Tutup dialog setelah data ditambahkan
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Simpan'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.black,
                                                    title: Text(
                                                        'Apakah yakin ingin menghapus data?', style: TextStyle(color: Colors.white),),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          // Simpan data baru ke Firestore
                                                          firestoreService
                                                              .deleteKomentar(
                                                                  documentSnapshot
                                                                      .id);

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Hapus', style: TextStyle(color: Colors.black),),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 133, 124),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Hapus",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              })
      ],
    );
  }
}
