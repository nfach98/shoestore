import 'package:equatable/equatable.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_colorway.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_image.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_size.dart';

class Shoes extends Equatable {
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
  final List<ShoesColorway>? colorways;
  final List<ShoesSize>? sizes;
  final List<ShoesImage>? images;

  Shoes({
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

  @override
  List<Object?> get props => [
    id,
    idCategory,
    nameCategory,
    title,
    subtitle,
    price,
    discount,
    description,
    image,
    createdAt,
    colorways,
    sizes,
    images,
  ];
}