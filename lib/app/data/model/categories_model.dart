class CategoriesModel {
  String? name;
  String? bottlePhoto;

  CategoriesModel({this.name,this.bottlePhoto});

  factory CategoriesModel.fromMap(map) {
    return CategoriesModel(
        name: map['name'],
      bottlePhoto: map['bottlePhoto'],

    );
  }
}