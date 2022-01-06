import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/screens/home/home_controller.dart';

import '../../../data/model/categories_model.dart';
import '../../../routes/app_pages.dart';
import 'category_item_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller)=>Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                TextButton(
                  child: Text("See all",style: TextStyle(color: Colors.grey),),
                onPressed: (){
                  Get.toNamed(Routes.categoryScreen);
                },),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
                itemCount: controller.categoriesList.length,
                itemBuilder: (content, index) {
                  CategoriesModel model = controller.categoriesList[index];
                  return CategoryItemWidget(model: model);
                }),
          ],
        ),
    );
  }
}