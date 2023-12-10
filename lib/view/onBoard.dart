import 'package:flutter/material.dart';
import 'package:menu/view/login.dart';

class onboard extends StatelessWidget {
  const onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              child: Image.asset(
                'images/onboard.png',
                fit: BoxFit.cover,
              )),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('WORLD IS',
                    style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.w900)),
                Row(
                  children: [
                    const Text(
                      'SO',
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'BEAUTIFUUUUL',
                      style: TextStyle(
                          fontSize: 34,
                          color: Color.fromRGBO(255, 199, 0, 1),
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                const Text(
                  "Don't let your laziness lock you up.",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200),
                ),
                const Text(
                  "Wake up and explore the whole world",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 46,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromRGBO(255, 199, 0, 1)
                    ),
                    height: 88,
                    width: double.infinity,
                    child: Center(
                      child: Text("Let’s go started", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
