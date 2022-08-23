import 'package:dartz/dartz.dart';
import 'package:mobile/module/detail/domain/entities/get_shoes_detail_entity.dart';
import 'package:mobile/module/detail/domain/repositories/detail_repository.dart';

import '../../../../common/errors/app_error.dart';

class GetShoesDetailUsecase {
  final DetailRepository _repository;

  GetShoesDetailUsecase(this._repository);

  Future<Either<AppError, GetShoesDetailEntity>> execute(GetShoesDetailParams params) {
    return _repository.getShoesDetail(id: params.id);
  }
}

class GetShoesDetailParams {
  final String id;

  GetShoesDetailParams({required this.id});
}