class NewAchivesModel {
  String? name;
  String? bottlePhoto;
  String? bottlePrice;

  NewAchivesModel({this.name,this.bottlePhoto,this.bottlePrice});

  factory NewAchivesModel.fromMap(map) {
    return NewAchivesModel(
      name: map['name'],
      bottlePhoto: map['bottlePhoto'],
      bottlePrice: map['bottlePrice'],

    );
  }
}