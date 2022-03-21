import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skiipe/auth/login.dart';
import 'package:skiipe/utils/colors.dart';

final _pageItems = <_PageItem>[
  _PageItem("assets/images/1.png", '  Welcome To Jessie Pay',
      'Become a Marchant and create store profile online'),
  _PageItem("assets/images/2.png", ' Nice and Tidy Crypto Portfolio!',
      'Search for online store and services with their location or barcodes'),
  _PageItem("assets/images/3.png", 'Receive and Send Money to Friends!',
      'Ask for reviews, share new discovery and expriences with friends')
];

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = Get.put(PageController());
  final userStorage = GetStorage();

  @override
  void initState() {
    _controller = PageController();

    // getCurrentUser();
    super.initState();

    _controller.addListener(() {
      setState(() {
        _page = _controller.page!;
      });
    });
  }

  // getCurrentUser() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     WidgetsBinding.instance!.addPostFrameCallback((_) {
  //       userStorage.write("uid", user.uid);
  //       userStorage.write("name", user.displayName);
  //       userStorage.write("email", user.email);
  //       Get.off(() => Otp());
  //     });
  //   }
  // }

  void _navigate() {
    Get.offAll(Login());
  }

  double _page = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  for (var item in _pageItems)
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Image.asset(
                            item.image,
                            height: 520,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Column(
                            children: [
                              Material(
                                color: primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 30),
                                  child: Text(
                                    item.message,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: 17),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _page > _pageItems.length - 2
                  ? RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      onPressed: _navigate,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15),
                        child: Text(
                          'Let\'s Get Started',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          elevation: 0,
                          color: buttonColor,
                          onPressed: _navigate,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                            child: Text(
                              'Skip',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        DotsIndicator(
                          position: _page,
                          dotsCount: _pageItems.length,
                          decorator: DotsDecorator(
                              spacing:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              color:
                                  Theme.of(context).accentColor.withOpacity(.2),
                              activeColor: Colors.white),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        RaisedButton(
                          elevation: 0,
                          color: buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                              side: const BorderSide(color: primaryColor)),
                          onPressed: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class _PageItem {
  final String image;
  final String title;
  final String message;

  _PageItem(this.image, this.title, this.message);
}
