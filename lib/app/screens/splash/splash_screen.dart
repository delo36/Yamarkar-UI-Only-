import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yamakar/app/screens/splash/splash_controller.dart';

import '../../constants/my_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<SplashController>(builder: (controller) {
          return Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'assets/logo.png',
                    height: MediaQuery.of(context).size.width / 2.5,
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                ),
                Expanded(
                  child: Text(
                    MyConstants.appName,
                    textScaleFactor: 2,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Text(MyConstants.bottomText1),
                        Text(MyConstants.bottomText2),
                      ],
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
