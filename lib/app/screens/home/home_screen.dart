import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yamakar/app/data/model/discount_model.dart';
import 'package:yamakar/app/data/model/new_achives_model.dart';

import '../../data/model/user_model.dart';
import 'components/category_widget.dart';
import 'components/discount_item_widget.dart';
import 'components/discount_widget.dart';
import 'components/greeting_widget.dart';
import 'components/new_achives_item_widget.dart';
import 'components/new_achives_widget.dart';
import 'components/search_widget.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final Stream<QuerySnapshot> categoriesStream =
  FirebaseFirestore.instance.collection('categories').snapshots();

  final Stream<QuerySnapshot> discountsStream =
  FirebaseFirestore.instance.collection('discounts').snapshots();

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
    return GetBuilder<HomeController>(
        builder: (controller)=>SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    children: <Widget>[
                      GreetingWidget(loggedInUser: loggedInUser),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 240,
                        child: Carousel(
                          autoplay: true,
                          showIndicator: true,
                          images: [
                            AssetImage("assets/chivas.png"),
                            AssetImage("assets/blackLabel.png")
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 32,
                      ),
                      CategoryWidget(),
                      SizedBox(
                        height: 32,
                      ),
                      NewAchivesWidget(),
                      SizedBox(
                        height: 32,
                      ),
                      DiscountWidget(),
                    ]
                ),
              ),
            ),
          ),
        ),
    );
  }
}










