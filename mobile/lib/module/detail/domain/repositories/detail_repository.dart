import 'package:dartz/dartz.dart';
import 'package:mobile/module/detail/domain/entities/get_shoes_detail_entity.dart';

import '../../../../common/errors/app_error.dart';

abstract class DetailRepository {
  Future<Either<AppError, GetShoesDetailEntity>> getShoesDetail(
      {required String id});
}
