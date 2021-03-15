import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosLoadingIndicator extends StatelessWidget {
  const IosLoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
