import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Qrcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Qrcode Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
