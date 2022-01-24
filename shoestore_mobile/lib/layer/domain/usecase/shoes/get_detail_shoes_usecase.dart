import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoestore_mobile/core/error/failures.dart';
import 'package:shoestore_mobile/core/usecase/usecase.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/domain/repository/shoes_repository.dart';

class GetDetailShoesUsecase extends UseCase<Shoes, GetDetailShoesParams> {
  final ShoesRepository repository;

  GetDetailShoesUsecase(this.repository);

  @override
  Future<Either<Failure, Shoes>> call(GetDetailShoesParams params) async {
    return await repository.getDetail(id: params.id);
  }
}

class GetDetailShoesParams extends Equatable {
  final String id;

  GetDetailShoesParams({@required this.id});

  @override
  List<Object> get props => [id];
}