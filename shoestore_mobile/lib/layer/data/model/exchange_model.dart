import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';

class ExchangeModel extends Exchange {
  final bool? success;
  final int? timestamp;
  final String? base;
  final String? date;
  final List<ExchangeRateModel>? rates;

  ExchangeModel({
    this.success,
    this.timestamp,
    this.base,
    this.date,
    this.rates,
  });

  factory ExchangeModel.fromJson(Map<String, dynamic> json) {
    var rates = [];

    if (json['rates'] != null) {
      rates = List<ExchangeRateModel>();
      Map<String, dynamic> jsonRates = json['rates'];
      jsonRates.entries.forEach((e) {
        rates.add(ExchangeRateModel(
          currency: e.key,
          rate: e.value
        ));
      });
    }

    return ExchangeModel(
      success : json['success'],
      timestamp : json['timestamp'],
      base : json['base'],
      date : json['date'],
      rates : rates,
    );
  }

  Map<String, dynamic> toJson() {
    var rates;
    if (this.rates != null) {
      rates = this.rates!.map((v) => v.toJson()).toList();
    }

    return {
      'success' : this.success,
      'timestamp' : this.timestamp,
      'base' : this.base,
      'date' : this.date,
      'rates' : rates,
    };
  }
}

class ExchangeRateModel extends ExchangeRate {
  final String? currency;
  final num? rate;

  ExchangeRateModel({
    this.currency,
    this.rate,
  });

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRateModel(
      currency : json['currency'],
      rate : json['rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency' : this.currency,
      'rate' : this.rate,
    };
  }
}