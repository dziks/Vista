

import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final String message;
  LoadingIndicator({Key key, this.message=""}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState(
    message:this.message
  );
  
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  final String message;
  _LoadingIndicatorState({this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Color.fromRGBO(49, 49, 147, 1),
              ),
            ),
            SizedBox(height:10),
            Text(message,
            textAlign: TextAlign.center,
            style: TextStyle(color:Color.fromRGBO(49, 49, 147, 1)),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingIndicatorWithMessage extends StatelessWidget {
  final String message;
  const LoadingIndicatorWithMessage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Color.fromRGBO(49, 49, 147, 1),
              ),
            ),
            SizedBox(height:10),
            Text("Loading..\n Please Wait",
            textAlign: TextAlign.center,
            style: TextStyle(color:Color.fromRGBO(49, 49, 147, 1)),
            ),
          ],
        ),
      ),
    );
  }
}