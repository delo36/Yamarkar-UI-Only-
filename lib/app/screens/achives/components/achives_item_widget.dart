import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamakar/app/data/model/categories_model.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/data/model/new_achives_model.dart';

import '../../../routes/app_pages.dart';

class AchivesItemWidget extends StatelessWidget {
  const AchivesItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final NewAchivesModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      //  Get.toNamed(Routes.categoryScreen);
      },
      child:  Padding(
        padding: EdgeInsets.all( 16),
        child:   Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child:   Column(
            children: <Widget>[
              SizedBox(height: 4,),
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${model.bottlePhoto}")
                    )
                ),
              ),
              SizedBox(height: 8,),
              Text("${model.bottlePrice} Kyat",style: TextStyle(fontSize: 17,),),
              SizedBox(height: 4),
              Text("${model.name}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),

            ],
          ),
        ),
      )
    );
  }
}