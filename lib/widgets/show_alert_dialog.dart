import 'package:flutter/material.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

// class ShowAlertDialog extends StatelessWidget {
//   final String title;
//   final String message;
//   final String actionText;
//   final Color actionTextColor;
//   final IconData icon;
//   final Color color;
//   final void Function() onPressed;
//   const ShowAlertDialog(
//       {Key key,
//       this.title,
//       this.message,
//       this.actionText,
//       this.icon,
//       this.color,
//       this.onPressed,
//       this.actionTextColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//           body: PlatformAlertDialog(
//         title: Text(
//           title,
//           style: TextStyle(
//             color: actionTextColor,
//             fontWeight: FontWeight.w700,
//             fontSize: 20,
//           ),
//         ),
//         content: Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Expanded(
//               child: Icon(
//                 icon,
//                 color: color,
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Text(message),
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           FlatButton(
//             onPressed: onPressed,
//             // () {
//             //   Navigator.of(context).pop();
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //       builder: (context) {
//             //         return Register();
//             //       },
//             //     ),
//             //   );

//             //   // Navigator.of(context).pop();
//             // },
//             child: Text(
//               actionText,
//               style: TextStyle(color: Colors.green.shade900),
//             ),
//           )
//         ],
//       ),

//     );
//   }
// }
void showAlertDialog({
  String title,
  String message,
  IconData icon,
  Color color,
  BuildContext context,
  void Function() onPressed,
  String actionText,
  Color actionTextColor,
  bool barrierDismissible = false,
  Color barrierColor,
}) {
  PlatformAlertDialog alertDialog = PlatformAlertDialog(
    title: Text(
      title,
      style: TextStyle(
        color: Color.fromRGBO(49, 49, 147, 1),
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    content: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Icon(
            icon,
            color: color,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(message),
        ),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: onPressed,
        child: Text(
          actionText,
          style: TextStyle(color: actionTextColor),
        ),
      )
    ],
  );
  showDialog(
    useSafeArea: false,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (_) => alertDialog,
  );
}


void showUpdateAlertDialog({
  String title,
  Widget child,
  IconData icon,
  Color color,
  BuildContext context,
  void Function() onPressed,
  void Function() onPressed2,
  String actionText,
  Color actionTextColor,
  bool barrierDismissible = false,
  Color barrierColor,
}) {
  PlatformAlertDialog alertDialog = PlatformAlertDialog(
    title: Text(
      title,
      style: TextStyle(
        color: Color.fromRGBO(49, 49, 147, 1),
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    content: child,
    actions: <Widget>[
      FlatButton(
        onPressed: onPressed2,
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      FlatButton(
        onPressed: onPressed,
        child: Text(
          actionText,
          style: TextStyle(color: actionTextColor),
        ),
      )
    ],
  );
  showDialog(
    useSafeArea: false,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (_) => alertDialog,
  );
}