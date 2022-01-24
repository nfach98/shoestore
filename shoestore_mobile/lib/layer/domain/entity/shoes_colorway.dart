import 'package:equatable/equatable.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_image.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_size.dart';

class ShoesColorway extends Equatable {
  final String? id;
  final String? idShoes;
  final String? style;
  final String? name;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final List<ShoesSize>? sizes;
  final List<ShoesImage>? images;

  ShoesColorway({
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

  @override
  List<Object?> get props => [
    id,
    idShoes,
    style,
    name,
    image,
    createdAt,
    updatedAt,
    sizes,
    images,
  ];
}