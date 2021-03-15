import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:vista/provider/auth_provider.dart';
import 'package:vista/provider/local/user_provider.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:vista/screens/home_page.dart';
import 'utils/data_connectivity_service.dart';
import 'dart:io' show Platform;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      builder: (context, _) {
        return DevicePreview(
          enabled: false,
          builder: (context) => StreamProvider(
            create: (context) {
              return DataConnectivityService()
                  .connectivityStreamController
                  .stream;
            },
            child: MyApp(),
          ),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      allowFontScaling: true,
      builder: () => Platform.isAndroid
          ? MaterialApp(
              locale: DevicePreview.locale(context), // Add the locale here
              builder: DevicePreview.appBuilder,
              navigatorKey: Get.key,
              title: 'Vista',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
                  bodyText1:
                      GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
                ),
              ),
              home: HomePage(),
            )
          : CupertinoApp(
              locale: DevicePreview.locale(context), // Add the locale here
              builder: DevicePreview.appBuilder,
              navigatorKey: Get.key,
              title: 'Vista',
              home: HomePage(),
              theme: CupertinoThemeData(
                primaryColor: Colors.red.shade900,
              ),
            ),
    );
  }
}
