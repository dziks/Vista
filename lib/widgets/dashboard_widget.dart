import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardWidget extends StatelessWidget {
  final String imageLink;
  final String description;
  const DashboardWidget({
    Key key,
    this.imageLink,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 300.h,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150.w,
                height: 150.h,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: Colors.green),
                  image: DecorationImage(
                      image: NetworkImage(imageLink), fit: BoxFit.fill),
                ),
              ),
              Text(
                description,
                style: TextStyle(color: Colors.black, fontSize: 55.ssp),
              )
            ],
          ),
        ],
      ),
    );
  }
}
