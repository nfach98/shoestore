import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile/module/home/domain/entities/get_shoes_entity.dart';
import 'package:mobile/module/home/domain/usecases/get_shoes_usecase.dart';

class HomeNotifier extends ChangeNotifier {
  final GetShoesUsecase getShoesUsecase;

  HomeNotifier({
    required this.getShoesUsecase
  });

  int page = 1;
  int limit = 12;

  List<ShoesEntity> listShoes = [];
  bool isLoadingShoes = true;
  bool isKeepLoadingShoes = true;
  String? errorShoes;

  Future<void> getShoes() async {
    if (isKeepLoadingShoes) {
      isLoadingShoes = true;
      notifyListeners();

      final result = await getShoesUsecase.execute(GetShoesParams(
        page: page
      ));

      result.fold(
        (l) => errorShoes = l.message,
        (r) {
          List<ShoesEntity>? listNew = r.shoes?.data;
          listShoes.addAll(listNew ?? []);
          if ((listNew?.length ?? 0) < limit) {
            isKeepLoadingShoes = false;
          } else {
            page++;
          }
        }
      );

      isLoadingShoes = false;
      notifyListeners();
    }
  }
}