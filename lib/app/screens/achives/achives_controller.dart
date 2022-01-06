import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/data/model/discount_model.dart';
import 'package:yamakar/app/data/model/new_achives_model.dart';

import '../../data/model/categories_model.dart';


class AchivesController extends GetxController {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReferenceForNewAchives;
  RxList<NewAchivesModel> newAchivesList = RxList<NewAchivesModel>([]);

  @override
  void onInit() {

    collectionReferenceForNewAchives =
        firebaseFirestore.collection("newAchives");
    newAchivesList.bindStream(getNewAchivesList());

    super.onInit();
  }


  Stream<List<NewAchivesModel>> getNewAchivesList() =>
      collectionReferenceForNewAchives.snapshots().map((query) =>
          query.docs.map((item) => NewAchivesModel.fromMap(item)).toList());

}