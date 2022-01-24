import 'package:dartz/dartz.dart';
import 'package:shoestore_mobile/core/error/failures.dart';
import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';

abstract class ExchangeRepository {
  Future<Either<Failure, Exchange>> getExchange({required String symbol1, required String symbol2});
}