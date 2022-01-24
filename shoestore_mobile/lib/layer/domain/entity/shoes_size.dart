import 'package:equatable/equatable.dart';

class ShoesSize extends Equatable {
  final int? id;
  final String? idShoes;
  final String? idColorway;
  final String? size;

  ShoesSize({
    this.id,
    this.idShoes,
    this.idColorway,
    this.size,
  });

  @override
  List<Object?> get props => [
    id,
    idShoes,
    idColorway,
    size,
  ];
}