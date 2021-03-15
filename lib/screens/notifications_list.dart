import 'package:flutter/material.dart';
import 'package:vista/screens/notification_reply.dart';



class NotificationsList extends StatefulWidget {
  NotificationsList({Key key}) : super(key: key);

  @override
  _NotificationsListState createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Card(
              //                           <-- Card widget
              child: ListTile(
                leading: Text('1'),
                title: Text('notifications'),
                trailing: Icon(Icons.arrow_right_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NotificationReply();
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
