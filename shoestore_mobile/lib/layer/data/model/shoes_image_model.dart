import 'package:shoestore_mobile/layer/domain/entity/shoes_image.dart';

class ShoesImageModel extends ShoesImage {
  final int? id;
  final String? idShoes;
  final String? idColorway;
  final String? image;

  ShoesImageModel({
    this.id,
    this.idShoes,
    this.idColorway,
    this.image,
  });

  factory ShoesImageModel.fromJson(Map<String, dynamic> json) {
    return ShoesImageModel(
      id : json['id'],
      idShoes : json['id_shoes'],
      idColorway : json['id_colorway'],
      image : json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : this.id,
      'id_shoes' : this.idShoes,
      'id_colorway' : this.idColorway,
      'image' : this.image,
    };
  }
}