import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu/service/firestore_service.dart';
import 'package:menu/view/detail.dart';
import 'package:menu/model/daftar.dart';
import 'package:menu/view/firstScreen.dart';
import 'package:menu/view/category.dart';
import 'package:menu/view/profile.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List pages = [firstScreen(), Kategori(), profile()];
  int _currentIndex = 1;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Kategori() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("All", style: TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kategoriPopuler() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Recomend", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),)
                            ],
                          ),
                        ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kategoriTerbaru() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),)
                            ],
                          ),
                        ),
                    ),
              
              
                  ],
                ),
              ),
              gridKategoriPopuler(),
              gridKategoriTerberu()
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
    );
  }
}



class kategoriPopuler extends StatefulWidget {
  const kategoriPopuler({super.key});

  @override
  State<kategoriPopuler> createState() => _kategoriPopulerState();
}

class _kategoriPopulerState extends State<kategoriPopuler> {
  List pages = [firstScreen(), Kategori(), profile()];
  int _currentIndex = 1;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Kategori() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("All", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),)
                            ],
                          ),
                        ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kategoriPopuler() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Recomend", style: TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kategoriTerbaru() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),)
                            ],
                          ),
                        ),
                    ),
              
              
                  ],
                ),
              ),
              gridKategoriPopuler()
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
    );
  }
}

class kategoriTerbaru extends StatefulWidget {
  const kategoriTerbaru({super.key});

  @override
  State<kategoriTerbaru> createState() => _kategoriTerbaruState();
}

class _kategoriTerbaruState extends State<kategoriTerbaru> {
  List pages = [firstScreen(), Kategori(), profile()];
  int _currentIndex = 1;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Kategori() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("All", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),)
                            ],
                          ),
                        ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kategoriPopuler() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Recomend", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),)
                            ],
                          ),
                        ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kategoriTerbaru() ));
                      },
                      child: Container(
                        height: 29,
                        width: 103,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 65, 70, 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New", style: TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                    ),
              
              
                  ],
                ),
              ),
              gridKategoriTerberu()
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
    );
  }
}

class gridKategori extends StatefulWidget {
  const gridKategori({super.key});

  @override
  State<gridKategori> createState() => _gridKategoriState();
}

class _gridKategoriState extends State<gridKategori> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getDestinasi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List userList = snapshot.data!.docs;
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1 / 2),
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
                                builder: (context) => detailPopuler(
                                    isiPopuler: data)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(65, 65, 70, 1)),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              SizedBox(
                                height: 300,
                                width: 200,
                                child: ClipRRect(
                                  child: Image(
                                      image: NetworkImage(data['gambar']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Container(
                                height: 300,
                                width: 200,
                                padding: EdgeInsets.only(left:10, bottom: 10),
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
                                          child: const Text(
                                        "⭐5.0",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['nama_destinasi'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['lokasi'],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            data['jarak'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }
        });
  }
}

class gridKategoriPopuler extends StatefulWidget {
  const gridKategoriPopuler({super.key});

  @override
  State<gridKategoriPopuler> createState() => _gridKategoriPopulerState();
}

class _gridKategoriPopulerState extends State<gridKategoriPopuler> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getDestinasi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List userList = snapshot.data!.docs;
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1 / 2),
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
                                builder: (context) => detailPopuler(
                                    isiPopuler: data)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(65, 65, 70, 1)),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              SizedBox(
                                height: 300,
                                width: 200,
                                child: ClipRRect(
                                  child: Image(
                                      image: NetworkImage(data['gambar']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Container(
                                height: 300,
                                width: 200,
                                padding: EdgeInsets.only(left:10, bottom: 10),
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
                                          child: const Text(
                                        "⭐5.0",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['nama_destinasi'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['lokasi'],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            data['jarak'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }
        });
  }
}

class gridKategoriTerberu extends StatefulWidget {
  const gridKategoriTerberu({super.key});

  @override
  State<gridKategoriTerberu> createState() => _gridKategoriTerberuState();
}

class _gridKategoriTerberuState extends State<gridKategoriTerberu> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getDestinasiNew(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List userList = snapshot.data!.docs;
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1 / 2),
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
                                builder: (context) => detailPopuler(
                                    isiPopuler: data)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(65, 65, 70, 1)),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              SizedBox(
                                height: 300,
                                width: 200,
                                child: ClipRRect(
                                  child: Image(
                                      image: NetworkImage(data['gambar']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Container(
                                height: 300,
                                width: 200,
                                padding: EdgeInsets.only(left:10, bottom: 10),
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
                                          child: const Text(
                                        "⭐5.0",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['nama_destinasi'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['lokasi'],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            data['jarak'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }
        });
  }
}