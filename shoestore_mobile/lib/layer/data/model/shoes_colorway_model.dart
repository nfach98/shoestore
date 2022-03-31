import 'package:shoestore_mobile/layer/data/model/shoes_image_model.dart';
import 'package:shoestore_mobile/layer/data/model/shoes_size_model.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_colorway.dart';

class ShoesColorwayModel extends ShoesColorway {
  final String? id;
  final String? idShoes;
  final String? style;
  final String? name;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final List<ShoesSizeModel>? sizes;
  final List<ShoesImageModel>? images;

  ShoesColorwayModel({
    this.id,
    this.idShoes,
    this.style,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.sizes,
    this.images,
  });

  factory ShoesColorwayModel.fromJson(Map<String, dynamic> json) {
    List<ShoesSizeModel>? shoesSize;
    if (json['sizes'] != null) {
      shoesSize = [];
      json['sizes'].forEach((v) {
        shoesSize?.add(ShoesSizeModel.fromJson(v));
      });
    }

    List<ShoesImageModel>? shoesImage;
    if (json['images'] != null) {
      shoesImage = [];
      json['images'].forEach((v) {
        shoesImage?.add(ShoesImageModel.fromJson(v));
      });
    }

    return ShoesColorwayModel(
      id : json['id'],
      idShoes : json['id_shoes'],
      style : json['style'],
      name : json['name'],
      image : json['image'],
      createdAt : json['created_at'],
      updatedAt : json['updated_at'],
      sizes : shoesSize,
      images : shoesImage,
    );
  }

  Map<String, dynamic> toJson() {
    var shoesSize;
    if (this.sizes != null) {
      shoesSize = this.sizes!.map((v) => v.toJson()).toList();
    }

    var shoesImage;
    if (this.images != null) {
      shoesImage = this.images!.map((v) => v.toJson()).toList();
    }

    return {
      'id' : this.id,
      'id_shoes' : this.idShoes,
      'style' : this.style,
      'name' : this.name,
      'image' : this.image,
      'created_at' : this.createdAt,
      'updated_at' : this.updatedAt,
      'sizes' : shoesSize,
      'images' : shoesImage,
    };
  }
}