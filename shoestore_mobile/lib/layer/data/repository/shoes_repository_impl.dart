import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:shoestore_mobile/core/error/exceptions.dart';
import 'package:shoestore_mobile/core/error/failures.dart';
import 'package:shoestore_mobile/core/network/network_info.dart';
import 'package:shoestore_mobile/layer/data/source/remote/shoes_remote_data_source.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/domain/repository/shoes_repository.dart';

typedef Future<List<Shoes>> _ListShoesLoader();
typedef Future<Shoes> _ShoesLoader();

class ShoesRepositoryImpl extends ShoesRepository {
  final ShoesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ShoesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });


  @override
  Future<Either<Failure, List<Shoes>>> getAll({int? page, String? category, String? sort}) async {
    return await _getListShoes(() {
      return remoteDataSource.getAll(
        page: page,
        category: category,
        sort: sort
      );
    });
  }

  @override
  Future<Either<Failure, Shoes>> getDetail({required String id}) async {
    return await _getShoes(() {
      return remoteDataSource.getDetail(id: id);
    });
  }


  Future<Either<Failure, List<Shoes>>> _getListShoes(_ListShoesLoader getListShoes) async {
    if (await networkInfo.connectivity != ConnectivityResult.none) {
      try {
        final remoteShoes = await getListShoes();
        return Right(remoteShoes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, Shoes>> _getShoes(_ShoesLoader getShoes) async {
    if (await networkInfo.connectivity != ConnectivityResult.none) {
      try {
        final remoteShoes = await getShoes();
        return Right(remoteShoes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
