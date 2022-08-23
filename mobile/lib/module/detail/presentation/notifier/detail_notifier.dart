import 'package:flutter/cupertino.dart';
import 'package:mobile/module/detail/domain/usecases/get_shoes_detail_usecase.dart';

import '../../../home/domain/entities/get_shoes_entity.dart';

class DetailNotifier extends ChangeNotifier {
  final GetShoesDetailUsecase getShoesDetailUsecase;

  DetailNotifier({
    required this.getShoesDetailUsecase
  });

  ShoesEntity? shoes;
  bool isLoadingShoes = true;
  String? errorShoes;

  Future<void> getShoes({required String id}) async {
    isLoadingShoes = true;
    notifyListeners();

    final result = await getShoesDetailUsecase.execute(
      GetShoesDetailParams(id: id)
    );

    result.fold(
      (l) => errorShoes = l.message,
      (r) => shoes = r.shoes,
    );

    isLoadingShoes = false;
    notifyListeners();
  }
}