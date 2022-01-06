import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/screens/category/category_controller.dart';
import '../../data/model/user_model.dart';
import '../category/components/category_item_widget.dart';
import '../../data/model/categories_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final Stream<QuerySnapshot> categoriesStream =
  FirebaseFirestore.instance.collection('categories').snapshots();


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
    return GetBuilder<CategoryController>(
        builder: (controller){
          return  Scaffold(
            appBar: AppBar(
              title: Text("Category"),
              centerTitle: true,
            ),
            body:  Container(
              child: GridView.builder(
                itemCount:  controller.categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  CategoriesModel model = controller.categoriesList[index];
                  return CategoryItemWidget(model: model);;
                },
              ),
            ),
          );
        }
    );
  }
}
