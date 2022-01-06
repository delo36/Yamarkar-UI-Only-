import 'package:get/get.dart';
import 'package:yamakar/app/screens/category/category_controller.dart';


class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
