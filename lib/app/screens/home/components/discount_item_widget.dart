import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yamakar/app/data/model/categories_model.dart';
import 'package:yamakar/app/data/model/discount_model.dart';
import 'package:yamakar/app/data/model/new_achives_model.dart';

class DiscountItemWidget extends StatelessWidget {
  const DiscountItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final DiscountModel model;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){

        },
        child:   Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:   Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("${model.bottlePhoto}")
                        )
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text("${model.name}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: 4,),
                  Text("${model.originalPrice} to ${model.newPrice} Kyat",style: TextStyle(fontSize: 17),),
                ],
              ),
            )
          ],
        )
    );
  }
}