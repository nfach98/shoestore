import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shoestore_mobile/core/error/failures.dart';
import 'package:shoestore_mobile/core/usecase/usecase.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/domain/repository/shoes_repository.dart';

class GetAllShoesUsecase extends UseCase<List<Shoes>, GetAllShoesParams> {
  final ShoesRepository repository;

  GetAllShoesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Shoes>>> call(GetAllShoesParams params) async {
    return await repository.getAll(
      page: params.page,
      category: params.category,
      sort: params.sort
    );
  }
}

class GetAllShoesParams extends Equatable {
  final int page;
  final String category;
  final String sort;

  GetAllShoesParams({this.page, this.category, this.sort});

  @override
  List<Object> get props => [page, category, sort];
}