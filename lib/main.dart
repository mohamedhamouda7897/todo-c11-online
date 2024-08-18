import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_c11_online/firebase_options.dart';
import 'package:todo_c11_online/home.dart';
import 'package:todo_c11_online/register/login.dart';
import 'package:todo_c11_online/register/signUp.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
        LoginScreen.routeName: (context) =>  LoginScreen(),
        SignUpScreen.routeName: (context) =>  SignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
