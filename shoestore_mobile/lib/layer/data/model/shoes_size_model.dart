import 'package:shoestore_mobile/layer/domain/entity/shoes_size.dart';

class ShoesSizeModel extends ShoesSize {
  final int? id;
  final String? idShoes;
  final String? idColorway;
  final String? size;

  ShoesSizeModel({
    this.id,
    this.idShoes,
    this.idColorway,
    this.size,
  });

  factory ShoesSizeModel.fromJson(Map<String, dynamic> json) {
    return ShoesSizeModel(
      id : json['id'],
      idShoes : json['id_shoes'],
      idColorway : json['id_colorway'],
      size : json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : this.id,
      'id_shoes' : this.idShoes,
      'id_colorway' : this.idColorway,
      'size' : this.size,
    };
  }
}