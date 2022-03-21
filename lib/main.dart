import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:skiipe/auth/login.dart';
import 'package:skiipe/auth/register.dart';
import 'package:skiipe/pages/dashboard/dashboard.dart';
import 'package:skiipe/pages/feed/feed_page.dart';
import 'package:skiipe/pages/home/home_page.dart';
import 'package:skiipe/pages/map/map.dart';
import 'package:skiipe/pages/profile/profile.dart';
import 'package:skiipe/pages/qr/qr.dart';
import 'package:skiipe/utils/colors.dart';
import 'package:skiipe/welcome/onboarding.dart';
import 'package:skiipe/welcome/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
        theme: ThemeData(
          primaryColor: buttonColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: buttonColor),
        ),
        getPages: [
          GetPage(name: '/', page: () => Splashscreen()),
          GetPage(name: '/onboarding', page: () => OnboardingScreen()),
          GetPage(name: '/login', page: () => Login()),
          GetPage(name: '/register', page: () => Register()),
          GetPage(name: '/dashboard', page: () => MyDashBoard()),
          GetPage(name: '/feed', page: () => FeedPage()),
          GetPage(name: '/home', page: () => HomePage()),
          GetPage(name: '/map', page: () => Maps()),
          GetPage(name: '/qr', page: () => Qrcode()),
          GetPage(name: '/profile', page: () => Profile()),

          // GetPage(
          //     name: '/third', page: () => Third(), transition: Transition.zoom),
          // GetPage(name: "/fourth", page: () => Fourth()),
        ],
      ),
    );
  }
}
