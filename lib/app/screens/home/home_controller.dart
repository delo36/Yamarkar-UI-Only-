import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/data/model/discount_model.dart';
import 'package:yamakar/app/data/model/new_achives_model.dart';

import '../../data/model/categories_model.dart';


class HomeController extends GetxController {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReferenceForCategories;
  RxList<CategoriesModel> categoriesList = RxList<CategoriesModel>([]);

  late CollectionReference collectionReferenceForNewAchives;
  RxList<NewAchivesModel> newAchivesList = RxList<NewAchivesModel>([]);

  late CollectionReference collectionReferenceForDiscountProducts;
  RxList<DiscountModel> discountProductList = RxList<DiscountModel>([]);

  @override
  void onInit() {
    collectionReferenceForCategories =
        firebaseFirestore.collection("categories");
    categoriesList.bindStream(getCategoriesList());

    collectionReferenceForNewAchives =
        firebaseFirestore.collection("newAchives");
    newAchivesList.bindStream(getNewAchivesList());

    collectionReferenceForDiscountProducts =
        firebaseFirestore.collection("discounts");
    discountProductList.bindStream(getDiscountProductList());

    super.onInit();
  }

  Stream<List<CategoriesModel>> getCategoriesList() =>
      collectionReferenceForCategories.snapshots().map((query) =>
          query.docs.map((item) => CategoriesModel.fromMap(item)).toList());

  Stream<List<NewAchivesModel>> getNewAchivesList() =>
      collectionReferenceForNewAchives.snapshots().map((query) =>
          query.docs.map((item) => NewAchivesModel.fromMap(item)).toList());

  Stream<List<DiscountModel>> getDiscountProductList() =>
      collectionReferenceForDiscountProducts.snapshots().map((query) =>
          query.docs.map((item) => DiscountModel.fromMap(item)).toList());

}