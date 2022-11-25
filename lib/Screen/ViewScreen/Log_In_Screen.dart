import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginscreen/Firebase/Firebase.dart';
import 'package:loginscreen/Screen/Controller/HomeController.dart';
import 'package:loginscreen/Screen/ViewScreen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  homeController Controller = Get.put(homeController());

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("   Email"),
                TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("   Password"),
                TextField(
                  controller: txtPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text("Not A User? "),
                   TextButton(onPressed: (){
                     Get.toNamed('signup');
                   }, child: Text("Sign Up"))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(child: ElevatedButton(onPressed: () async{

                  String msg = await logIn(txtEmail.text, txtPassword.text);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${msg}"),));

                  if(msg == "Success")
                    {
                      Get.offNamed('home');
                    }



                }, child: Text("Log In")))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
