import 'package:flutter/material.dart';


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 120.0,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: FlatButton.icon(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.yellowAccent,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: Text("Back",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: Colors.black)),
                  color: Colors.white,
                ),
              ),
              buildMenuItem(
                Icons.new_releases_sharp,
                "ECG NEWS",
                opacity: 1.0,
                color: Color.fromRGBO(49, 49, 147, 1),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Container();
                      },
                    ),
                  );
                },
              ),
              Divider(),
              buildMenuItem(Icons.note_add_rounded, "Safety Tips"),
              Divider(),
              // buildMenuItem(Icons.receipt, "STATEMENTS"),
              // Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Opacity buildMenuItem(IconData icon, String title,
      {double opacity = 0.3,
      Color color = Colors.black,
      void Function() onTap}) {
    return Opacity(
      opacity: opacity,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Icon(
                icon,
                size: 25.0,
                color: color,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      color: color)),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
