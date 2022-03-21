import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skiipe/auth/login.dart';
import 'package:skiipe/pages/dashboard/dashboard.dart';
import 'package:skiipe/welcome/onboarding.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Splashscreen> {
  final userStorage = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        userStorage.write("uid", user.uid);
        userStorage.write("name", user.displayName);
        userStorage.write("email", user.email);
        Get.off(() => MyDashBoard());
      });
    } else {
      // await Future.delayed(Duration(milliseconds: 2000));
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Get.off(OnboardingScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),

      // Center(

      // ),
    );
  }
}
