import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:shoestore_mobile/core/error/exceptions.dart';
import 'package:shoestore_mobile/core/error/failures.dart';
import 'package:shoestore_mobile/core/network/network_info.dart';
import 'package:shoestore_mobile/layer/data/source/remote/exchanges_remote_data_source.dart';
import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';
import 'package:shoestore_mobile/layer/domain/repository/exchanges_repository.dart';

typedef Future<Exchange> _ExchangeLoader();

class ExchangeRepositoryImpl extends ExchangeRepository {
  final ExchangeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ExchangeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Exchange>> getExchange({required String symbol1, required String symbol2}) async {
    return await _getExchange(() {
      return remoteDataSource.getExchange(
        symbol1: symbol1,
        symbol2: symbol2
      );
    });
  }


  Future<Either<Failure, Exchange>> _getExchange(_ExchangeLoader getExchange) async {
    if (await networkInfo.connectivity != ConnectivityResult.none) {
      try {
        final remoteExchange = await getExchange();
        return Right(remoteExchange);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}