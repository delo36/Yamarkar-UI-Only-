import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../data/model/categories_model.dart';
class CategoryController extends GetxController {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReferenceForCategories;
  RxList<CategoriesModel> categoriesList = RxList<CategoriesModel>([]);

  @override
  void onInit() {
    collectionReferenceForCategories =
        firebaseFirestore.collection("categories");
    categoriesList.bindStream(getCategoriesList());


    super.onInit();
  }

  Stream<List<CategoriesModel>> getCategoriesList() =>
      collectionReferenceForCategories.snapshots().map((query) =>
          query.docs.map((item) => CategoriesModel.fromMap(item)).toList());
}