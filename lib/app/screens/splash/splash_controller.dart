import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/my_constants.dart';
import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  bool showNetworkDialog = false;

  @override
  void onInit() {
    checkNetwork();
  }

  Future<void> GetConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAndToNamed(Routes.loginScreen);
        });
        break;
      case ConnectivityResult.mobile:
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAndToNamed(Routes.loginScreen);
        });
        break;
      case ConnectivityResult.none:
        _showMyDialog();
        break;
      default:
        _showMyDialog();
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }

  void checkNetwork() {
    GetConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> _showMyDialog() async {
    return Get.defaultDialog(
        title: MyConstants.checkText1,
        content: Text(MyConstants.checkText2),
        barrierDismissible: false,
        textConfirm: "Ok",
        onConfirm: () {
          Get.back();
          _streamSubscription =
              _connectivity.onConnectivityChanged.listen(_updateState);
        });
  }
}
