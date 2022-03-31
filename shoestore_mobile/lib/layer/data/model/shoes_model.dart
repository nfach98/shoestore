import 'package:shoestore_mobile/layer/data/model/shoes_colorway_model.dart';
import 'package:shoestore_mobile/layer/data/model/shoes_image_model.dart';
import 'package:shoestore_mobile/layer/data/model/shoes_size_model.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';

class ShoesModel extends Shoes {
  final String? id;
  final String? idCategory;
  final String? nameCategory;
  final String? title;
  final String? subtitle;
  final String? price;
  final String? discount;
  final String? description;
  final String? image;
  final String? createdAt;
  final List<ShoesColorwayModel>? colorways;
  final List<ShoesSizeModel>? sizes;
  final List<ShoesImageModel>? images;

  ShoesModel({
    this.id,
    this.idCategory,
    this.nameCategory,
    this.title,
    this.subtitle,
    this.price,
    this.discount,
    this.description,
    this.image,
    this.createdAt,
    this.colorways,
    this.sizes,
    this.images,
  });

  factory ShoesModel.fromJson(Map<String, dynamic> json) {
    List<ShoesColorwayModel>? shoesColorway;
    if (json['colorways'] != null) {
      shoesColorway = [];
      json['colorways'].forEach((v) {
        shoesColorway?.add(ShoesColorwayModel.fromJson(v));
      });
    }

    List<ShoesSizeModel>? sizes;
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes?.add(ShoesSizeModel.fromJson(v));
      });
    }

    List<ShoesImageModel>? images;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(ShoesImageModel.fromJson(v));
      });
    }

    return ShoesModel(
      id : json['id'],
      idCategory : json['id_category'],
      nameCategory : json['name_category'],
      title : json['title'],
      subtitle : json['subtitle'],
      price : json['price'],
      discount : json['discount'],
      description : json['description'],
      image : json['image'],
      createdAt : json['created_at'],
      colorways : shoesColorway,
      sizes : sizes,
      images : images,
    );
  }

  Map<String, dynamic> toJson() {
    var shoesColorway;
    if (this.colorways != null) {
      shoesColorway = this.colorways!.map((v) => v.toJson()).toList();
    }

    var sizes;
    if (this.sizes != null) {
      sizes = this.sizes!.map((v) => v.toJson()).toList();
    }

    var images;
    if (this.images != null) {
      images = this.images!.map((v) => v.toJson()).toList();
    }

    return {
      'id' : this.id,
      'id_category' : this.idCategory,
      'name_category' : this.nameCategory,
      'title' : this.title,
      'subtitle' : this.subtitle,
      'price' : this.price,
      'discount' : this.discount,
      'description' : this.description,
      'image' : this.image,
      'created_at' : this.createdAt,
      'colorways' : shoesColorway,
      'sizes' : sizes,
      'images' : images,
    };
  }
}

