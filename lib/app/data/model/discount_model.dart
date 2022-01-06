class DiscountModel {
  String? name;
  String? bottlePhoto;
  String? originalPrice;
  String? newPrice;

  DiscountModel({this.name,this.bottlePhoto,this.originalPrice,this.newPrice});

  factory DiscountModel.fromMap(map) {
    return DiscountModel(
      name: map['name'],
bottlePhoto: map['bottlePhoto'],
originalPrice: map['originalPrice'],
      newPrice: map['newPrice']
    );
  }
}