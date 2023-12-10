import 'package:firebase_auth/firebase_auth.dart';
import 'package:menu/service/firebase_auth_service.dart';
import 'package:menu/view/firstScreen.dart';
import 'package:menu/View/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();
  final TextEditingController _NIMController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    _usernameController.dispose();
    _nomorController.dispose();
    _NIMController.dispose();
    super.dispose();
  }

  void register() async{
    String email = _emailController.text;
    String password = _passwordController.text;
    String fullname = _fullnameController.text;
    String username = _usernameController.text;
    String nomor = _nomorController.text;
    String NIM = _NIMController.text;
    User? user = await _authService.signUpWithEmailandPassword(email, password, context);
    if(user != null){
      await _authService.createUserInFirestore(user, username, fullname, NIM, nomor);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User is successfully created"),
          backgroundColor: Colors.green,
        )
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(31, 32, 38, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              const Text(
                "SIGN UP",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: _fullnameController,
                decoration: const InputDecoration(
                  hintText: "Fullname",
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
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: "Username",
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
                controller: _nomorController,
                decoration: const InputDecoration(
                  hintText: "nomor",
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
                controller: _NIMController,
                decoration: const InputDecoration(
                  hintText: "NIM",
                  hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(255, 199, 0, 1))
                  )
                ),
                cursorColor: Color.fromRGBO(255, 199, 0, 1),
                style: TextStyle(color: Colors.white)
              ),const SizedBox(
                height: 12.0,
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
                  const Text("Sudah punya akun?", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),),
                  const SizedBox(width: 4.0),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text(
                        "Login",
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
                      register();
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
              ),
              const SizedBox(
                height: 16.0,
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
      ),
    );
  }
}
