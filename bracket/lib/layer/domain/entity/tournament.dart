import 'package:equatable/equatable.dart';

class Tournament extends Equatable {
  final String id;
  final String name;

  Tournament({
    this.id,
    this.name
  });

  @override
  List<Object> get props => [
    id,
    name
  ];
}