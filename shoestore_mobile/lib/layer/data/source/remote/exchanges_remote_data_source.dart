import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shoestore_mobile/core/constant/constants.dart';
import 'package:shoestore_mobile/core/error/exceptions.dart';
import 'package:shoestore_mobile/layer/data/model/exchange_model.dart';
import 'package:shoestore_mobile/layer/data/model/shoes_model.dart';
import 'package:http/http.dart' as http;

abstract class ExchangeRemoteDataSource {
  Future<ExchangeModel> getExchange({required String symbol1, required String symbol2});
}

class ExchangeRemoteDataSourceImpl implements ExchangeRemoteDataSource {
  @override
  Future<ExchangeModel> getExchange({required String symbol1, required String symbol2}) async {
    final response = await http.get('http://api.exchangeratesapi.io/v1/latest?access_key=3f30164b9a4ac2e8c947c2f5c511e911'
        '&symbols=$symbol1,$symbol2&format=1');

    if (response.statusCode == 200) {
      ExchangeModel exchanges = ExchangeModel.fromJson(json.decode(response.body));
      return exchanges;
    } else {
      throw ServerException();
    }
  }
}