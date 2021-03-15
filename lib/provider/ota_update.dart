import 'package:flutter/material.dart';
// import 'package:ota_update/ota_update.dart';

enum Status {NotDownloading,Downloading,Downloaded}

class OtaUpdate extends ChangeNotifier{


//  Future<void> tryOtaUpdate() async {
//     try {
//       //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
//       OtaUpdate().execute(
//         'https://internal1.4q.sk/flutter_hello_world.apk',
//         destinationFilename: 'flutter_hello_world.apk',
//         //FOR NOW ANDROID ONLY - ABILITY TO VALIDATE CHECKSUM OF FILE:
//         sha256checksum: "d6da28451a1e15cf7a75f2c3f151befad3b80ad0bb232ab15c20897e54f21478",
//       )
//           .listen(
//         (OtaEvent event) {
          
//         },
//       );
//     } catch (e) {
//       print('Failed to make OTA update. Details: $e');
//     }
//   }

}