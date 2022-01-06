import 'package:get/get.dart';

import 'achives_controller.dart';



class AchivesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AchivesController>(() => AchivesController());
  }
}
