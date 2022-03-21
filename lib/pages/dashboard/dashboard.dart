import 'package:flutter/material.dart';
import 'package:skiipe/pages/feed/feed_page.dart';
import 'package:skiipe/pages/home/home_page.dart';
import 'package:skiipe/pages/map/map.dart';
import 'package:skiipe/pages/profile/profile.dart';
import 'package:skiipe/pages/qr/qr.dart';
import 'package:skiipe/utils/colors.dart';

import '../../navigation/custom_animated_bottom_bar.dart';

class MyDashBoard extends StatefulWidget {

  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text("Skiipe",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),

        ),
        body: getBody(),
        bottomNavigationBar: _buildBottomBar()
    );
  }

  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('Home'),
          activeColor: primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.apps_outlined),
          title: Text('Feeds'),
          activeColor: primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.camera_alt_outlined),
          title: Text(
            'QRCode ',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.pin_drop_outlined),
          title: Text('Maps'),
          activeColor: primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Profile'),
          activeColor: primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      FeedPage(),
      Qrcode(),
      Maps(),
      Profile()

    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }


}