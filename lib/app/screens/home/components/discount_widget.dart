import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/screens/home/home_controller.dart';

import '../../../data/model/discount_model.dart';
import 'discount_item_widget.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller)=> Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Discount Products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                Text("See all"),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
                itemCount: controller.discountProductList.length,
                itemBuilder: (content, index) {
                  DiscountModel model = controller.discountProductList[index];
                  return DiscountItemWidget(model: model);
                }),
          ],
        ),
    );
  }
}