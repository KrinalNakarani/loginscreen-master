
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginscreen/Screen/ViewScreen/HomeScreen.dart';
import 'package:loginscreen/Screen/ViewScreen/Log_In_Screen.dart';
import 'package:loginscreen/Screen/ViewScreen/Sign_Up_Screen.dart';
import 'package:loginscreen/Screen/ViewScreen/SpleshScreen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>SpleshScreen(),
        'home':(context)=>HomeScreen(),
        'signup':(context)=>SignUpScreen(),
        'login':(context)=>LoginScreen(),
      },
    )
  );
}