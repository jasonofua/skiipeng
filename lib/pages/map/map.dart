import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<Maps> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Map Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );;
  }
}
