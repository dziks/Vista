// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista/android/screens/signup.dart';
import 'package:vista/screens/dashboard.dart';
import 'package:vista/widgets/text_input_field.dart';
import 'dart:io' show Platform;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return 
    Platform.isAndroid
        ? 
        Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        Text(
                          "Welcome To Vista,",
                          style: TextStyle(
                              fontSize: 80.ssp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Sign in to continue!",
                          style: TextStyle(
                              fontSize: 60.ssp, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextInputField(
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.red.shade900,
                            ),
                            labelText: "Email ID",
                            labelStyleColor: Colors.black,
                            cursorColor: Colors.red,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextInputField(
                            obscureText: !obscureText,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye_sharp,
                                color: this.obscureText
                                    ? Color.fromRGBO(238, 28, 37, 1)
                                    : Colors.black,
                              ),
                              onPressed: () {
                                setState(
                                    () => this.obscureText = !this.obscureText);
                              },
                            ),
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.lock_open_rounded,
                              color: Colors.red.shade900,
                            ),
                            labelText: "Password",
                            labelStyleColor: Colors.black,
                            cursorColor: Colors.red,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  fontSize: 45.ssp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          Container(
                            // height: 130.h,
                            width: double.infinity,
                            child: FlatButton(
                              color: Colors.red.shade900,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Dashboard();
                                    },
                                  ),
                                );
                              },
                              padding: EdgeInsets.all(0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      maxWidth: double.infinity, minHeight: 50),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60.ssp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "I'm a new user.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        Text(
                          "Welcome To Vista,",
                          style: TextStyle(
                              fontSize: 80.ssp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Sign in to continue!",
                          style: TextStyle(
                              fontSize: 60.ssp,
                              color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                    SizedBox(
                          height: 900.h,
                        ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IosTextInputField(
                          placeholder: 'Email ID',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        IosTextInputField(
                          obscureText: !obscureText,
                           keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                fontSize: 45.ssp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Container(
                          height: 130.h,
                          width: double.infinity,
                          child: CupertinoButton(
                            color: Colors.red.shade900,
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return Dashboard();
                                  },
                                ),
                              );
                            },
                            padding: EdgeInsets.all(0),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                  maxWidth: double.infinity, minHeight: 50),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60.ssp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(6),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "I'm a new user.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
