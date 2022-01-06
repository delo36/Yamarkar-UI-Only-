import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/data/model/new_achives_model.dart';
import 'package:yamakar/app/screens/achives/achives_controller.dart';
import 'package:yamakar/app/screens/category/category_controller.dart';
import '../../data/model/user_model.dart';
import '../category/components/category_item_widget.dart';
import '../../data/model/categories_model.dart';
import 'components/achives_item_widget.dart';

class AchivesScreen extends StatefulWidget {
  const AchivesScreen({Key? key}) : super(key: key);

  @override
  _AchivesScreenState createState() => _AchivesScreenState();
}

class _AchivesScreenState extends State<AchivesScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final Stream<QuerySnapshot> newAchivesStream =
  FirebaseFirestore.instance.collection('newAchives').snapshots();


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
    return GetBuilder<AchivesController>(
        builder: (controller){
          return  Scaffold(
            appBar: AppBar(
              title: Text("New Achives"),
              centerTitle: true,
            ),
            body:  Container(
              child: GridView.builder(
                itemCount:  controller.newAchivesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  NewAchivesModel model = controller.newAchivesList[index];
                  return AchivesItemWidget(model: model);
                },
              ),
            ),
          );
        }
    );
  }
}
