import 'package:equatable/equatable.dart';

class ShoesImage extends Equatable {
  final int? id;
  final String? idShoes;
  final String? idColorway;
  final String? image;

  ShoesImage({
    this.id,
    this.idShoes,
    this.idColorway,
    this.image,
  });

  @override
  List<Object?> get props => [
    id,
    idShoes,
    idColorway,
    image,
  ];
}