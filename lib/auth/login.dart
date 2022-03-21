import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:skiipe/Model/user.dart' as uss;
import 'package:skiipe/auth/register.dart';
import 'package:skiipe/pages/dashboard/dashboard.dart';
// import 'package:payfiat/pages/home.dart';
import 'package:skiipe/service/firebase.dart';
import 'package:skiipe/services/database.dart';
import 'package:skiipe/utils/colors.dart';
import 'package:skiipe/utils/validator.dart';

class Login extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Login> {
  bool remember = false;
  String email = '';
  String password = '';
  bool isLoading = false;
  final userStorage = GetStorage();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sign In",
                              style: GoogleFonts.ptSansNarrow(
                                textStyle: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xff120D26),
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          margin: EdgeInsets.all(12),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Icon(
                                  FontAwesome.mail,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "abcd@example.com",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    isDense: true,
                                  ),
                                  validator: (value) =>
                                      Validator.validateEmail(email: value!),
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          margin: EdgeInsets.all(12),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Icon(
                                  FontAwesome.lock,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Your Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    isDense: true,
                                  ),
                                  validator: (value) =>
                                      Validator.validatePassword(
                                          password: value!),
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 28,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: SwitchListTile(
                                  activeColor: primaryColor,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text('Remember me',
                                      style: GoogleFonts.ptMono(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff120D26),
                                            fontWeight: FontWeight.normal),
                                      )),
                                  value: remember,
                                  onChanged: (bool value) {
                                    setState(() {
                                      remember = value;
                                    });
                                  },
                                ),
                              ),
                              Text("Forgot password?",
                                  style: GoogleFonts.ptMono(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff120D26),
                                        fontWeight: FontWeight.normal),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 45, right: 45),
                        child: Container(
                          child: RaisedButton(
                            color: buttonColor,
                            onPressed: () async {
                              if (email.isEmpty) {
                                showSimpleNotification(
                                  Text("Email field can not be empty..."),
                                  trailing: Builder(builder: (context) {
                                    return TextButton(
                                        onPressed: () {
                                          OverlaySupportEntry.of(context)!
                                              .dismiss();
                                        },
                                        child: Text('Dismiss',
                                            style: TextStyle(
                                                color: Colors.white)));
                                  }),
                                  background: primaryColor,
                                  autoDismiss: false,
                                  slideDismissDirection: DismissDirection.up,
                                );
                                return;
                              }
                              if (password.length < 6) {
                                showSimpleNotification(
                                  Text(
                                      "Password length can not be less than 6 characters..."),
                                  trailing: Builder(builder: (context) {
                                    return TextButton(
                                        onPressed: () {
                                          OverlaySupportEntry.of(context)!
                                              .dismiss();
                                        },
                                        child: Text('Dismiss',
                                            style: TextStyle(
                                                color: Colors.white)));
                                  }),
                                  background: primaryColor,
                                  autoDismiss: false,
                                  slideDismissDirection: DismissDirection.up,
                                );
                                return;
                              }
                              if (password.isEmpty) {
                                showSimpleNotification(
                                  Text(
                                      "Password length can not be less than 6 characters..."),
                                  trailing: Builder(builder: (context) {
                                    return TextButton(
                                        onPressed: () {
                                          OverlaySupportEntry.of(context)!
                                              .dismiss();
                                        },
                                        child: Text('Dismiss',
                                            style: TextStyle(
                                                color: Colors.white)));
                                  }),
                                  background: primaryColor,
                                  autoDismiss: false,
                                  slideDismissDirection: DismissDirection.up,
                                );
                                return;
                              }
                              setState(() {
                                isLoading = true;
                              });

                              User? user =
                                  await FireAuth.signInUsingEmailPassword(
                                email: email,
                                password: password,
                              );
                              if (user != null) {
                                DocumentSnapshot userInfoSnapshot =
                                    await DatabaseMethods()
                                        .getUserInfo(user.uid);
                                print("ere ${userInfoSnapshot.data()}");
                                uss.User users =
                                    uss.User.fromJson(userInfoSnapshot.data());
                                userStorage.write("uid", user.uid);
                                userStorage.write("firstName", users.firstName);
                                userStorage.write("email", user.email);
                                userStorage.write("lastName", users.lastName);
                                setState(() {
                                  isLoading = false;
                                });

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Skiipe Login '),
                                        content: Text(
                                            "Login Complete.."),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: new Text('Ok'),
                                            onPressed: () {
                                              Get.back();
                                              Get.off(MyDashBoard());
                                            },
                                          )
                                        ],
                                      );
                                    });
                                // showSimpleNotification(
                                //   Text("Login Complete..Home page coming soon"),
                                //   trailing: Builder(builder: (context) {
                                //     return TextButton(
                                //         onPressed: () {
                                //           OverlaySupportEntry.of(context)!
                                //               .dismiss();
                                //         },
                                //         child: Text('Dismiss',
                                //             style: TextStyle(
                                //                 color: Colors.white)));
                                //   }),
                                //   background: primaryColor,
                                //   autoDismiss: false,
                                //   slideDismissDirection: DismissDirection.up,
                                // );
                                //Get.off(() => Home());
                              } else {
                                isLoading = false;
                                showSimpleNotification(
                                  Text(
                                      "Error login in please check login details and try again"),
                                  trailing: Builder(builder: (context) {
                                    return TextButton(
                                        onPressed: () {
                                          OverlaySupportEntry.of(context)!
                                              .dismiss();
                                        },
                                        child: Text('Dismiss',
                                            style: TextStyle(
                                                color: Colors.white)));
                                  }),
                                  background: primaryColor,
                                  autoDismiss: false,
                                  slideDismissDirection: DismissDirection.up,
                                );
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'SIGN IN',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("OR",
                              style: GoogleFonts.ptSansNarrow(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff9D9898),
                                    fontWeight: FontWeight.normal),
                              )),
                        ),
                      ),
                      Container(
                        height: 68,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/images/google.png"),
                              height: 31.0,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Sign in with Google',
                                  style: GoogleFonts.ptMono(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff120D26),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(Register());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff120D26),
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  " Sign up",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
