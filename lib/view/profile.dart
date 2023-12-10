import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu/model/daftar.dart';
import 'package:menu/view/profileSocmed.dart';
import 'package:menu/service/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:menu/service/firebase_auth_service.dart';
import 'package:menu/view/category.dart';
import 'package:menu/view/firstScreen.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  final FirebaseAuthService _authService = FirebaseAuthService();

  Future<void> updateUserInfireStore(String userId, Map<String, dynamic> updateUserData) async{
    try{
      await FirebaseFirestore.instance.collection('users').doc(userId).update(updateUserData);
    }catch (e){
      throw e;
    }
  }
  List pages = [
    firstScreen(),
    Kategori(),
    profile()
  ];
  int _currentIndex = 2;
  void onTap(int index){
    setState(() {
      _currentIndex = index;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[_currentIndex]));
    });
  }
  @override
  Widget build(BuildContext context) {
    User? currentUser = _authService.getCurrentUser();
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
            label: "Search",
            icon: Icon(Icons.search_rounded)
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person)
          ),
        ]
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(!snapshot.hasData){
            return Center(child: Text('No data available'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;
          return ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 130,
                      height: 180,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            daftarProfil[0].gambar,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        const Text("WEL-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900)),
                        const Text("COME",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900)),
                        const Text("BACK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profileSocmed()));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(65,65,70,1)
                          ),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              const Text("Social Media", style: TextStyle(
                                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600
                              ),),
                              SizedBox(width: 200),
                              Icon(Icons.arrow_right_alt_rounded, color: Colors.white,)
                            ],
                          ),
                        ),
                        ),
                    ],
                  )
                ),
                SizedBox(
                  height: 32,
                ),
                Text(userData['fullname'], style: TextStyle(
                  color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800
                ),),
                SizedBox(
                  height: 16,
                ),
                Text("- Username: @" + userData['username'] , style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500
                ),),
                Text("- NIM: " + userData['NIM'] , style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500
                ),),
                Text("- No. HP: " + userData['nomor'] , style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500
                ),),
                Text("- email: " + userData['email'] , style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500
                ),),
                SizedBox(
                  height: 21,
                ),
                const Text("Catatan: ", style: TextStyle(
                  color: Colors.white
                ),),
                SizedBox(height: 10,),
                const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et nibh in libero iaculis scelerisque nec a justo. Etiam blandit nisi et ipsum venenatis, ut placerat tellus condimentum. Praesent porttitor enim mauris, luctus fermentum lorem suscipit ac. Nulla quis tellus at erat imperdiet vulputate quis mollis lorem. Aenean placerat metus ligula, eget consectetur orci laoreet at. Donec facilisis erat justo, et venenatis justo luctus eget. Integer egestas nunc non neque tincidunt ultricies. Donec efficitur quis turpis ac commodo. Etiam at nisl tempor, maximus diam ac, facilisis purus.Quisque a velit at orci dictum auctor. Cras eu venenatis dui. Nunc at neque pellentesque mauris mattis molestie a sed nisi. Nunc at feugiat diam. Integer pulvinar justo nibh. Nunc a aliquet purus, at sollicitudin leo. Donec ipsum dui, finibus nec sapien vitae, viverra porttitor nibh. Vivamus tempus orci eu arcu mollis elementum. Praesent aliquam elit sit amet varius tincidunt. Fusce vel enim justo. Vestibulum pretium velit et rutrum ultrices. Sed facilisis ex placerat, tempor nisl eu, placerat tellus. Nullam porta pellentesque urna a convallis. Mauris non pharetra tellus, tempus imperdiet dui. Fusce consectetur nunc non facilisis interdum.: ", style: TextStyle(
                  color: Colors.white,
                ), textAlign: TextAlign.justify,)
              ],
            ),
          )
        ],
      );
        },
      ),
      backgroundColor:  Color.fromRGBO(31, 32, 38, 1),
    );
  }
}
