import 'package:flutter/material.dart';
import 'package:menu/view/profile.dart';

class profileSocmed extends StatelessWidget {
  const profileSocmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 32, 38, 1),
        title: Text(
          "Social Media",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => profile()));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "images/instagram.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ahmad",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "@ahmdfaiizzz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              )),
            Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "images/twitter.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pink Floyd",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "@pinkfloyd",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              )),
              
              Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "images/facebook.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ahmad Faiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "@ahmadfaiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              )),
              Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "images/linkedin.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ahmad Faiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "@ahmadfaiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              )),
              Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "images/mail.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ahmad Faiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "@ahmafaiz007@gmail.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
