import 'package:get/get.dart';
import 'package:yamakar/app/screens/category/category_controller.dart';
import 'package:yamakar/app/screens/discount/discount_controller.dart';


class DiscountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscountController>(() => DiscountController());
  }
}
