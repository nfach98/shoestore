import 'package:equatable/equatable.dart';

class Exchange extends Equatable {
  final bool? success;
  final int? timestamp;
  final String? base;
  final String? date;
  final List<ExchangeRate>? rates;

  Exchange({
    this.success,
    this.timestamp,
    this.base,
    this.date,
    this.rates,
  });

  @override
  List<Object?> get props => [
    success,
    timestamp,
    base,
    date,
    rates,
  ];
}

class ExchangeRate extends Equatable {
  final String? currency;
  final num? rate;

  ExchangeRate({
    this.currency,
    this.rate,
  });

  @override
  List<Object?> get props => [
    currency,
    rate,
  ];
}

