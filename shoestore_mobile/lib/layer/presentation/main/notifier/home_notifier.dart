import 'package:flutter/material.dart';
import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/domain/usecase/exchange/get_exchange_usecase.dart';
import 'package:shoestore_mobile/layer/domain/usecase/shoes/get_all_shoes_usecase.dart';

class HomeNotifier with ChangeNotifier {
  final GetAllShoesUsecase _allShoesUsecase;
  final GetExchangeUsecase _exchangeUsecase;

  HomeNotifier({
    required GetAllShoesUsecase allShoesUsecase,
    required GetExchangeUsecase exchangeUsecase,
  })  : _allShoesUsecase = allShoesUsecase,
        _exchangeUsecase = exchangeUsecase;

  List<Shoes> shoes = [];
  bool isLoadingShoes = true;
  bool isKeepLoadingShoes = true;
  int pageShoes = 1;

  Exchange? exchange;

  Future<void> getAllShoes({String? category, String? sort}) async {
    isLoadingShoes = true;
    notifyListeners();

    final result = await _allShoesUsecase(GetAllShoesParams(
      page: pageShoes,
      category: category,
      sort: sort
    ));

    result.fold(
      (l) {
        isLoadingShoes = false;
      },
      (r) {
        if (isKeepLoadingShoes) {
          shoes.addAll(r);
          if(r.isNotEmpty) pageShoes++;
          else isKeepLoadingShoes = false;
        }

        isLoadingShoes = false;
      }
    );

    notifyListeners();
  }

  Future<void> getExchange({required String symbol1, required String symbol2}) async {
    final result = await _exchangeUsecase(GetExchangeParams(
      symbol1: symbol1,
      symbol2: symbol2
    ));

    result.fold(
      (l) { },
      (r) {
        exchange = r;
      }
    );

    notifyListeners();
  }
}
