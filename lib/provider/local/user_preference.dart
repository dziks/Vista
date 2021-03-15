
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vista/model/user_model.dart';

class UserPreferences {
  bool requestStatus;
  bool storedStatus;
  Future saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("staffName", user.staffName);
    prefs.setInt("staffNumber", user.staffNumber);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String staffName = prefs.getString("staffName");
    int staffNumber = prefs.getInt("staffNumber");

    return User(staffName: staffName, staffNumber: staffNumber);
  }

  Future<String> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("staffNumber");
    prefs.remove("staffName");

    return 'removed';
  }

  // Future<String> getToken(args) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString("token");
  //   return token;
  // }
  Future<bool> setRequestStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    requestStatus = true;
    prefs.setBool("requestStatus", requestStatus);

    storedStatus = prefs.getBool("requestStatus");
    return storedStatus;
  }

  Future<bool> checkRequestStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     storedStatus = prefs.getBool("requestStatus");
     return storedStatus;
  }
}
