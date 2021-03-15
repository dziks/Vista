import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:package_info/package_info.dart';
import 'package:vista/model/response_model.dart';
import 'package:vista/model/user_model.dart';
import 'dart:async';
import 'local/user_preference.dart';

// import 'package:data_connection_checker/data_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

enum Status { LoggedIn, NotLoggedIn, Authenticating, Error, NoInternet }
enum Progress { NotLoading, Loading, Checked, NoInternet }

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _loggedInStatusSettings = Status.LoggedIn;
  Progress _progress = Progress.NotLoading;
  bool _isLoading = false;
  Status get loggedInStatus => _loggedInStatus;
  Status get loggedInStatusSettings => _loggedInStatusSettings;
  Progress get progress => _progress;
  bool get isLoading => _isLoading;
  ResponseModel responseModel;
  String _responseMessage = '';
  String _userName = '';
  String _userRemoved;
  String _time = '';
  String _savedStaffName;
  String _savedStaffNumber;
  User _user;
  // AppVersionModel _appVersionModel;
  String _updateStatus;
  double _currentVersion;
  double _newVersion;

  User get user => _user;
  String get time => _time;
  String get responseMessage => _responseMessage;
  String get userName => _userName;
  String get userRemoved => _userRemoved;
  String get savedStaffName => _savedStaffName;
  String get savedStaffNumber => _savedStaffNumber;
  // AppVersionModel get appVersionModel => _appVersionModel;
  String get updateStatus => _updateStatus;
  double get currentVersion => _currentVersion;
  double get newVersion => _newVersion;

  Future<String> login({
    @required String username,
    @required String password,
  }) async {
    //set status to authenticating which will return a progress bar
    _loggedInStatus = Status.Authenticating;
    notifyListeners();
    //get an instance of shared preferences to save the user model incase of a successful log in
    // final prefs = await SharedPreferences.getInstance();/
    //encode the username and password in json
    final body = jsonEncode({"username": username, "password": password});

    try {
      //actual call to api
      final response = await http
          .post("/login/admin/user/login", body: body, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        //convert the response body into a user model
        if (data == null) {
          _loggedInStatus = Status.NotLoggedIn;
          _responseMessage = 'Please register first';
          notifyListeners();
          return _responseMessage;
        } else {
          greeting();
          User user = User.fromJson(data);
          UserPreferences().saveUser(user);
          // User user2 = await UserPreferences().getUser();
          // _savedStaffName = user2.staffName;
          // _savedStaffNumber = user2.staffNumber.toString();
          getSavedDetails();
          _loggedInStatus = Status.LoggedIn;
          notifyListeners();
          return null;
        }
      
      } else if (response.statusCode == 400) {
        var data = json.decode(response.body);
        _loggedInStatus = Status.Error;
        responseModel = ResponseModel.fromJson(data);
        _responseMessage = responseModel.message;
        notifyListeners();
        return _responseMessage;
      } else {
        _loggedInStatus = Status.Error;
        notifyListeners();
        var data = json.decode(response.body);
        //decode the response from the api and set it to responseMessage variable
        responseModel = ResponseModel.fromJson(data);
        _responseMessage = responseModel.message;
        notifyListeners();
        return _responseMessage;
      }
    } on SocketException catch (_) {
      _loggedInStatus = Status.NoInternet;
      notifyListeners();
      return 'No Internet Connection';
    } catch (e) {
      _loggedInStatus = Status.Error;
      notifyListeners();

      return 'Error';
    }
    // await Future.delayed(Duration(seconds: 1));
    // return 'dziks';
  }

  Future<String> logOut() async {
    // print("BEFORE $_isLoading");
    // await Future.delayed(Duration(seconds: 2));
    _loggedInStatus = Status.Authenticating;
    notifyListeners();
    // print("AFTER $_isLoading");
    UserPreferences userPreferences = UserPreferences();
    _userRemoved = await userPreferences.removeUser();
    await Future.delayed(Duration(seconds: 1));
    _loggedInStatusSettings = Status.NotLoggedIn;
    _loggedInStatus = Status.NotLoggedIn;
    notifyListeners();
    return _userRemoved;
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      _time = 'Morning';
      notifyListeners();
      return _time;
    } else if ((hour >= 12) && (hour < 16)) {
      _time = 'Afternoon';
      notifyListeners();
      return _time;
    } else {
      _time = 'Evening';
      notifyListeners();
      return _time;
    }
  }

  Future<String> register({
    @required String username,
    @required String password,
    @required String staffNumber,
  }) async {
    //set status to authenticating which will return a progress bar
    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    final body = jsonEncode({
      "Username": username,
      "Password": password,
      "StaffNumber": staffNumber
    });

    try {
      //actual call to api
      final response = await http
          .post("/login/admin/user/register", body: body, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        _responseMessage = data;
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        return _responseMessage;
      } else {
        _loggedInStatus = Status.Error;
        notifyListeners();
        var data = json.decode(response.body);
        //decode the response from the api and set it to responseMessage variable
        responseModel = ResponseModel.fromJson(data);
        _responseMessage = responseModel.message;
        notifyListeners();
        return _responseMessage;
      }
    } on SocketException catch (_) {
      _loggedInStatus = Status.NoInternet;
      notifyListeners();
      return 'No Internet Connection';
    } catch (e) {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();

      return e.toString();
    }
  }

  Future<User> getSavedDetails() async {
    User user = await UserPreferences().getUser();
    _user = user;
    notifyListeners();
    return _user;
  }

  // Future<String> versionCheck() async {
  //   _progress = Progress.Loading;
  //   final PackageInfo info = await PackageInfo.fromPlatform();
  //   _currentVersion = double.parse(info.version.trim().replaceAll(".", ""));

  //   try {
  //     //actual call to api
  //     final response = await http.get("$baseUrl/app/version", headers: {
  //       'Content-Type': 'application/json',
  //     });
  //     if (response.statusCode == 200) {
  //       var data = json.decode(response.body);
  //       // AppVersionModel appVersionModel = AppVersionModel.fromJson(data);
  //       // _appVersionModel = appVersionModel;
  //       _newVersion = double.parse(
  //           _appVersionModel.appVersion.trim().replaceAll(".", ""));
  //       if (newVersion > currentVersion) {
  //         _updateStatus = 'update';
  //         print(_updateStatus);
  //         _progress = Progress.Checked;
  //         notifyListeners();
  //         return _updateStatus;
  //       } else {
  //         _updateStatus = 'no_update';
  //         _progress = Progress.Checked;
  //         notifyListeners();
  //         print(_updateStatus);
  //         return _updateStatus;
  //       }
  //     } else {
  //       return null;
  //     }
  //   } on SocketException catch (_) {
  //     _progress = Progress.NoInternet;
  //     _updateStatus = 'no_internet';
  //     notifyListeners();
  //     return _updateStatus;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
