import 'package:dartz/dartz.dart';
import 'package:mobile/common/errors/app_error.dart';
import 'package:mobile/module/home/domain/repositories/home_repository.dart';

import '../entities/get_shoes_entity.dart';

class GetShoesUsecase {
  final HomeRepository _repository;

  GetShoesUsecase(this._repository);

  Future<Either<AppError, GetShoesEntity>> execute(GetShoesParams params) {
    return _repository.getShoes(page: params.page);
  }
}

class GetShoesParams {
  final int? page;

  GetShoesParams({this.page});
}