import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shoestore_mobile/core/error/failures.dart';
import 'package:shoestore_mobile/core/usecase/usecase.dart';
import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';
import 'package:shoestore_mobile/layer/domain/repository/exchanges_repository.dart';

class GetExchangeUsecase extends UseCase<Exchange, GetExchangeParams> {
  final ExchangeRepository repository;

  GetExchangeUsecase(this.repository);

  @override
  Future<Either<Failure, Exchange>> call(GetExchangeParams params) async {
    return await repository.getExchange(
      symbol1: params.symbol1,
      symbol2: params.symbol2
    );
  }
}

class GetExchangeParams extends Equatable {
  final String symbol1;
  final String symbol2;

  GetExchangeParams({required this.symbol1, required this.symbol2});

  @override
  List<Object> get props => [
    symbol1,
    symbol2
  ];
}