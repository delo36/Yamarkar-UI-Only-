import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/screens/home/home_controller.dart';

import '../../../data/model/new_achives_model.dart';
import '../../../routes/app_pages.dart';
import 'new_achives_item_widget.dart';

class NewAchivesWidget extends StatelessWidget {
  const NewAchivesWidget({
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
                Text("New Achives",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
             TextButton(onPressed: (){
               Get.toNamed(Routes.newAchivesScreen);
             },
                 child: Text("See All",style: TextStyle(fontSize: 17,color: Colors.grey),))
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
                itemCount: controller.newAchivesList.length,
                itemBuilder: (content, index) {
                  NewAchivesModel model = controller.newAchivesList[index];
                  return NewAchivesItemWidget(model: model);
                }),
          ],
        ),
    );
  }
}