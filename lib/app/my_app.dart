import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/routes/app_pages.dart';

import 'constants/yamakar_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: YaMaKarTheme.light(),
      darkTheme: YaMaKarTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: Routes.splashScreen,
      getPages: AppRoutes.routes,
    );
  }
}
