import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/data/model/discount_model.dart';
import 'package:yamakar/app/screens/category/category_controller.dart';
import 'package:yamakar/app/screens/discount/discount_controller.dart';
import '../../data/model/user_model.dart';
import '../discount/components/discount_item_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final Stream<QuerySnapshot> discountsStream =
  FirebaseFirestore.instance.collection('discounts').snapshots();


  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscountController>(
        builder: (controller){
          return  Scaffold(
            appBar: AppBar(
              title: Text("Discounts"),
              centerTitle: true,
            ),
            body:  Container(
              child: GridView.builder(
                itemCount:  controller.discountProductList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  DiscountModel model = controller.discountProductList[index];
                  return DiscountItemWidget(model: model);;
                },
              ),
            ),
          );
        }
    );
  }
}
