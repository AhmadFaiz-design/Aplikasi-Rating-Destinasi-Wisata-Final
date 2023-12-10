import 'package:firebase_auth/firebase_auth.dart';
import 'package:menu/service/firebase_auth_service.dart';
import 'package:menu/view/firstScreen.dart';
import 'package:flutter/material.dart';
import 'package:menu/view/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async{
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.loginWithEmailandPassword(email, password, context);
    if(user != null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login success"),
          backgroundColor: Colors.green,
        )
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => firstScreen()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login failed"),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 32, 38, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            const Text(
              "LOGIN",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            const SizedBox(
              height: 62.0,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(255, 199, 0, 1))
                )
              ),
              cursorColor: Color.fromRGBO(255, 199, 0, 1),
              style: TextStyle(color: Colors.white)
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(255, 199, 0, 1))
                )
              ),
              cursorColor: Color.fromRGBO(255, 199, 0, 1),
              style: TextStyle(color: Colors.white),
              obscureText: true,
            ),
            const SizedBox(
              height: 31.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),),
                const SizedBox(width: 4.0),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 199, 0, 1)),
                  onPressed: () {
                    login();
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ),
            /*const SizedBox(
              height: 280.0,
            ),
            const Text("Created by", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(
              height: 18.0,
            ),
            const Text("Ahmad Faiz", style: TextStyle(color: Color.fromRGBO(255, 199, 0, 1), fontSize: 14, fontWeight: FontWeight.w300))*/
          ],
        ),
      ),
    );
  }
}
