import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vista/provider/auth_provider.dart';
import 'package:vista/screens/log_in_screen.dart';
import 'dart:io' show Platform;

class EntryPage extends StatelessWidget {
  const EntryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Platform.isAndroid
        ? Scaffold(
            body: auth.loggedInStatus == Status.NotLoggedIn
                ? LoginPage()
                : auth.loggedInStatus == Status.LoggedIn
                    ? Container(
                        child: Center(child: Text("Dashboard")),
                      )
                    : LoginPage(),
          )
        : CupertinoPageScaffold(
            child: auth.loggedInStatus == Status.NotLoggedIn
                ? LoginPage()
                : auth.loggedInStatus == Status.LoggedIn
                    ? Container(
                        child: Center(child: Text("Dashboard")),
                      )
                    : LoginPage(),
          );
  }
}
