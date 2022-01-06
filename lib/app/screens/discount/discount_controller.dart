import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:yamakar/app/data/model/discount_model.dart';
import 'package:yamakar/app/data/model/new_achives_model.dart';

import '../../data/model/categories_model.dart';


class DiscountController extends GetxController {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  late CollectionReference collectionReferenceForDiscountProducts;
  RxList<DiscountModel> discountProductList = RxList<DiscountModel>([]);

  @override
  void onInit() {

    collectionReferenceForDiscountProducts =
        firebaseFirestore.collection("discounts");
    discountProductList.bindStream(getDiscountProductList());

    super.onInit();
  }

  Stream<List<DiscountModel>> getDiscountProductList() =>
      collectionReferenceForDiscountProducts.snapshots().map((query) =>
          query.docs.map((item) => DiscountModel.fromMap(item)).toList());

}