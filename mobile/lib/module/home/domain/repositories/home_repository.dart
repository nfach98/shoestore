import 'package:dartz/dartz.dart';
import 'package:mobile/module/home/domain/entities/get_shoes_entity.dart';

import '../../../../common/errors/app_error.dart';

abstract class HomeRepository {
  Future<Either<AppError, GetShoesEntity>> getShoes({int? page, String? search});
}