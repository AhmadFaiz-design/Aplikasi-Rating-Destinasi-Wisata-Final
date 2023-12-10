import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menu/service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:menu/view/detail.dart';
import 'package:menu/view/category.dart';
import 'package:menu/view/profile.dart';
import 'package:menu/model/daftar.dart';

class profilNama extends StatelessWidget {
  const profilNama({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => profile()));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, " + daftarProfil[0].nama,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const Text(
                  "Where you want to go?",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w200),
                )
              ],
            ),
            SizedBox(
              width: 120,
            ),
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: AssetImage(daftarProfil[0].gambar),
            )
          ],
        ),
      ),
    );
  }
}

class searchField extends StatefulWidget {
  const searchField({super.key});

  @override
  State<searchField> createState() => _searchFieldState();
}

class _searchFieldState extends State<searchField> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class populer extends StatefulWidget {
  const populer({super.key});

  @override
  State<populer> createState() => _populerState();
}

class _populerState extends State<populer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => kategoriPopuler()) 
                    );
                  },
                  child: const Text("Recommends", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => kategoriPopuler()));
                  },
                  child: Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirestoreService().getDestinasi(),
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }else{
                  if(snapshot.hasError){
                    return Text(snapshot.error.toString());
                  }else{
                    List userList = snapshot.data!.docs;
                    return  Container(
                        height: 189,
                        child: ListView.builder(
                          itemCount: userList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot documentSnapshot = userList[index];
                              Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => detailPopuler(isiPopuler: data)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          height: 139,
                                           width: 165,
                                           child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Image(
                                             image: NetworkImage(data['gambar']),
                                              fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                          height: 139,
                                          width: 165,
                                          padding: EdgeInsets.only(left: 8,bottom: 9),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 67,
                                                height: 26,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(18),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: const Text("⭐5.0", style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w300
                                                      ),)
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                     Text(
                                            data['nama_destinasi'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            data['lokasi'],
                                            style: TextStyle(color: Colors.white),
                                          ),
                                  ],
                                ),
                              )
                            );
                          },
                        ),
                      );
                  }
                }
              }
            )
          ],
        ),
      ),
    );
  }
} 

class terbaru extends StatefulWidget {
  const terbaru({super.key});

  @override
  State<terbaru> createState() => _terbaruState();
}

class _terbaruState extends State<terbaru> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => kategoriTerbaru()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirestoreService().getDestinasi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    List userList = snapshot.data!.docs;
                    return SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot documentSnapshot = userList[index];
                          Map<String, dynamic> data =
                              documentSnapshot.data() as Map<String, dynamic>;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => detailTerbaru(
                                          isiTerbaru: data)));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              padding: EdgeInsets.all(13),
                              height: 148,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 44, 44, 44),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        height: 122,
                                         width: 122,
                                         child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image(
                                           image: NetworkImage(data['gambar']),
                                            fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: 122,
                                        width: 122,
                                        padding: EdgeInsets.only(left: 8,bottom: 9),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 67,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(18),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: const Text("⭐5.0", style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w300
                                                    ),)
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['nama_destinasi'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        data['lokasi'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                            data['jarak'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white),
                                          ),
                                      Row(
                                        children: [
                                          Text(
                                            data['harga'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "/ppl",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.amber),
                                          ),
                                          SizedBox(
                                            width: 65,
                                          ),
                                          Text("see all", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
