// import 'package:package_info/package_info.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// // import 'dart:async';
// // import 'package:package_info/package_info.dart';


// class Functions {
//   versionCheck(context) async {
//     //Get Current installed version of app
//     final PackageInfo info = await PackageInfo.fromPlatform();
//     double currentVersion =
//         double.parse(info.version.trim().replaceAll(".", ""));

//     // Get Latest version info from firebase config
//     final RemoteConfig remoteConfig = await RemoteConfig.instance;
//     // final RemoteConfig remoteConfig =await RemoteConfig.instance

//     try {
//       // Using default duration to force fetching from remote server.
//       await remoteConfig.fetch(expiration: const Duration(seconds: 0));
//       await remoteConfig.activateFetched();
//       remoteConfig.getString('force_update_current_version');
//       double newVersion = double.parse(remoteConfig
//           .getString('force_update_current_version')
//           .trim()
//           .replaceAll(".", ""));
//       if (newVersion > currentVersion) {
//         // _showVersionDialog(context);
//       }
//     } on FetchThrottledException catch (exception) {
//       // Fetch throttled.
//       print(exception);
//     } catch (exception) {
//       print('Unable to fetch remote config. Cached or default values will be '
//           'used');
//     }
//   }
// }
