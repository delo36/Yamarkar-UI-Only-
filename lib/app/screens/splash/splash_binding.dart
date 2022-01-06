import 'package:get/get.dart';
import 'package:yamakar/app/screens/splash/splash_controller.dart';



class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
