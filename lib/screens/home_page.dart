import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vista/model/user_model.dart';
import 'package:vista/provider/auth_provider.dart';
import 'package:vista/provider/local/user_preference.dart';
import 'package:vista/screens/entry_page.dart';
import 'package:vista/widgets/loading_indicator.dart';
import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() => context.read<AuthProvider>().getSavedDetails());
    Future.microtask(() => context.read<AuthProvider>().greeting());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();
    return Platform.isAndroid
        ? Scaffold(
            body: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return LoadingIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else if (snapshot.data.staffName == null)

                      // return the entry point rather than the log in screen
                      return EntryPage();
                    else if (snapshot.data.staffName != null)
                      return Container(
                        child: Text("Dashboard"),
                      );
                    else
                      // UserPreferences().removeUser();
                      return EntryPage();
                }
              },
            ), //  child: child,
          )
        : CupertinoPageScaffold(
            child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return LoadingIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else if (snapshot.data.staffName == null)

                    // return the entry point rather than the log in screen
                    return EntryPage();
                  else if (snapshot.data.staffName != null)
                    return Container(
                      child: Text("Dashboard"),
                    );
                  else
                    // UserPreferences().removeUser();
                    return EntryPage();
              }
            },
          ));
  }
}
