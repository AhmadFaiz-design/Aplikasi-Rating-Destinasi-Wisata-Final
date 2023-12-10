import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menu/firebase_options.dart';
import 'view/firstScreen.dart';
import 'package:menu/View/login.dart';
import 'package:menu/view/onBoard.dart';

late FirebaseApp app;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Faiz's Project",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const onboard(),
    );
  }
}