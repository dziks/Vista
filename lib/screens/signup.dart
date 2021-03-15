import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista/widgets/text_input_field.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureText = false;
  bool obscureTextConfirm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 60.ssp, color: Colors.grey.shade400),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextInputField(
                      hintText: "Name",
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.red.shade900,
                      ),
                      labelText: "Name",
                      labelStyleColor: Colors.black,
                      cursorColor: Colors.red,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextInputField(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.mail,
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
                          setState(() => this.obscureText = !this.obscureText);
                        },
                      ),
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock_open_rounded,
                        color: Colors.red.shade900,
                      ),
                      labelText: "Password",
                      labelStyleColor: Colors.black,
                      cursorColor: Colors.red,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextInputField(
                      obscureText: !obscureTextConfirm,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_sharp,
                          color: this.obscureTextConfirm
                              ? Color.fromRGBO(238, 28, 37, 1)
                              : Colors.black,
                        ),
                        onPressed: () {
                          setState(() => this.obscureTextConfirm = !this.obscureTextConfirm);
                        },
                      ),
                      hintText: "Confirm Password",
                      prefixIcon: Icon(
                        Icons.lock_open_rounded,
                        color: Colors.red.shade900,
                      ),
                      labelText: "Confirm Password",
                      labelStyleColor: Colors.black,
                      cursorColor: Colors.red,
                    ),
                    
                   
                    SizedBox(
                      height: 60.h,
                    ),
                    Container(
                      height: 130.h,
                      width: double.infinity,
                      child: FlatButton(
                        color: Colors.red.shade900,
                        onPressed: () {
                          print("Registered");
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
                              "Sign Up",
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
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}