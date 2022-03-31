import 'package:flutter/material.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/domain/usecase/shoes/get_detail_shoes_usecase.dart';

class DetailShoesNotifier with ChangeNotifier {
  final GetDetailShoesUsecase _detailShoesUsecase;

  DetailShoesNotifier({
    required GetDetailShoesUsecase detailShoesUsecase,
  })  : _detailShoesUsecase = detailShoesUsecase;

  Shoes? shoes;
  bool isLoadingShoes = true;

  int selectedColorway = 0;

  Future<void> getShoes({required String id}) async {
    isLoadingShoes = true;
    notifyListeners();

    final result = await _detailShoesUsecase(GetDetailShoesParams(id: id));

    result.fold(
      (l) { },
      (r) {
        shoes = r;
      }
    );

    isLoadingShoes = false;
    notifyListeners();
  }

  setSelectedColorway(int value) {
    selectedColorway = value;
    notifyListeners();
  }
}
