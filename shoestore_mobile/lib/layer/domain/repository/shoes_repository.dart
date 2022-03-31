import 'package:dartz/dartz.dart';
import 'package:shoestore_mobile/core/error/failures.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';

abstract class ShoesRepository {
  Future<Either<Failure, List<Shoes>>> getAll({int? page, String? category, String? sort});

  Future<Either<Failure, Shoes>> getDetail({required String id});
}