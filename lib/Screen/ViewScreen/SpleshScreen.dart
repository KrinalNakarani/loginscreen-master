import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginscreen/Firebase/Firebase.dart';
import 'package:loginscreen/Screen/Controller/HomeController.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {

  homeController Controller = Get.put(homeController());


  bool msg =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msg = checkUser();

  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), ()=>msg?Get.offNamed('home'):Get.offNamed('login'));
    return SafeArea(child: Scaffold(

      body: Center(child: FlutterLogo
        (
        size: 150,
      )),
    ));
  }
}
