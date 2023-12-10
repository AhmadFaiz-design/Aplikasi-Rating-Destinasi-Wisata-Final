import 'package:flutter/material.dart';
import 'package:menu/view/category.dart';
import 'package:menu/view/mainmenu.dart';
import 'package:menu/view/profile.dart';
import 'package:menu/model/daftar.dart';
import 'package:menu/view/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menu/service/firestore_service.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  List pages = [firstScreen(), Kategori(), profile()];
  int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[_currentIndex]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(31, 32, 38, 1),
          selectedItemColor: Color.fromRGBO(255, 199, 0, 1),
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          iconSize: 32,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
                label: "Search", icon: Icon(Icons.search_rounded)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
              child: Container(
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
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => kategoriPopuler()));
                    },
                    child: const Text(
                      "Recommends",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => kategoriPopuler()));
                    },
                    child: Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ]),
            //RECOMMENDSSSSSSSSSSSSSSSS!!!!!!!!!!!!
            SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirestoreService().getDestinasi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        List userList = snapshot.data!.docs;
                        return Container(
                          height: 190,
                          child: ListView.builder(
                            itemCount: userList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot documentSnapshot =
                                  userList[index];
                              Map<String, dynamic> data = documentSnapshot
                                  .data() as Map<String, dynamic>;
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => detailPopuler(
                                                isiPopuler: data)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 139,
                                              width: 165,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image(
                                                    image: NetworkImage(
                                                        data['gambar']),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Container(
                                              height: 139,
                                              width: 165,
                                              padding: EdgeInsets.only(
                                                  left: 8, bottom: 9),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: 67,
                                                    height: 26,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18),
                                                      color: Colors.white,
                                                    ),
                                                    child: Center(
                                                        child: const Text(
                                                      "⭐5.0",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    )),
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
                                  ));
                            },
                          ),
                        );
                      }
                    }
                  }),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => kategoriTerbaru()));
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

            //NEWWWWWWW!!!!!!!!!!!!
            StreamBuilder<QuerySnapshot>(
                stream: FirestoreService().getDestinasiNew(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      List userList = snapshot.data!.docs;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot documentSnapshot =
                                userList[index];
                            Map<String, dynamic> data = documentSnapshot
                                .data() as Map<String, dynamic>;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            detailTerbaru(isiTerbaru: data)));
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image(
                                                image: NetworkImage(
                                                    data['gambar']),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                          height: 122,
                                          width: 122,
                                          padding: EdgeInsets.only(
                                              left: 8, bottom: 9),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 67,
                                                height: 26,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                    child: const Text(
                                                  "⭐5.0",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )),
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
                                          style:
                                              TextStyle(color: Colors.white),
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
                                            Text(
                                              "see all",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w300),
                                            )
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
      ),
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
    );
  }
} 

// ListView(
//           children: <Widget>[
//             SizedBox(height: 25),
//             profilNama(),
//             populer(),
//             SizedBox(height: 20,),
//             terbaru(),
//           ],
//         ),

// class bottomNav extends StatefulWidget {
//   const bottomNav({super.key});

//   @override
//   State<bottomNav> createState() => _bottomNavState();
// }

// class _bottomNavState extends State<bottomNav> {
//   List pages = [
//     firstScreen(),
//     Kategori(),
//     profile()
//   ];
//   int _currentIndex = 0;
//   void onTap(int index){
//     setState(() {
//       _currentIndex = index;
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => pages[_currentIndex]));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTap,
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Color.fromRGBO(31, 32, 38, 1),
//         selectedItemColor: Color.fromRGBO(255, 199, 0, 1),
//         unselectedItemColor: Colors.white,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedFontSize: 0,
//         unselectedFontSize: 0,
//         elevation: 0,
//         iconSize: 32,
//         items: [
//           BottomNavigationBarItem(
//             label: "Home",
//             icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             label: "Search",
//             icon: Icon(Icons.search_rounded)
//           ),
//           BottomNavigationBarItem(
//             label: "Profile",
//             icon: Icon(Icons.person)
//           ),
//         ]
//       ),
//     );
//   }
// }

