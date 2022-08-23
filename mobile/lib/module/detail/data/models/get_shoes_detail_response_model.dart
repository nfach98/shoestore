import 'dart:collection';

import '../../../home/data/models/get_shoes_response_model.dart';

class GetShoesDetailResponseModel {
  GetShoesDetailResponseModel({
    this.shoes,
  });

  ShoesModel? shoes;

  factory GetShoesDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      GetShoesDetailResponseModel(
        shoes: json['shoes'] == null
            ? null : ShoesModel.fromJson(json['shoes']),
      );

  HashMap<String, dynamic> get toMap {
    HashMap<String, dynamic> map = HashMap<String, dynamic>();
    map['shoes'] = shoes?.toMap;
    return map;
  }
}