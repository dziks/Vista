import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonDescription;
  final IconData icon;
  final void Function() onPressed;
  final Color color;
  const SubmitButton(
      {Key key, this.buttonDescription, this.icon, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Color.fromRGBO(49, 49, 147, 1)),
        child: RaisedButton(
          onPressed: onPressed,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonDescription,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
