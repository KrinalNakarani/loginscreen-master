import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginscreen/Firebase/Firebase.dart';
import 'package:loginscreen/Screen/Controller/HomeController.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  homeController Controller = Get.put(homeController());


  TextEditingController txtEmail =TextEditingController();
  TextEditingController txtPassword =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                height: 60,
              ),
              Center(child: ElevatedButton(onPressed: () async {
                String msg = await singUp(txtEmail.text, txtPassword.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${msg}"),));

                if(msg == "Success")
                {
                  Get.offNamed('login');
                }

              }, child: Text("Sign Up")))
            ],
          ),
        ),
      ),
    ));
  }
}
