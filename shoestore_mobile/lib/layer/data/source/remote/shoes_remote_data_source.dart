import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shoestore_mobile/core/constant/constants.dart';
import 'package:shoestore_mobile/core/error/exceptions.dart';
import 'package:shoestore_mobile/layer/data/model/shoes_model.dart';
import 'package:http/http.dart' as http;

abstract class ShoesRemoteDataSource {
  Future<List<ShoesModel>> getAll({int page, String category, String sort});

  Future<ShoesModel> getDetail({@required String id});
}

class ShoesRemoteDataSourceImpl implements ShoesRemoteDataSource {
  @override
  Future<List<ShoesModel>> getAll({int page, String category, String sort}) async {
    Map<String, dynamic> body = {};
    if (page != null) body["page"] = page.toString();
    if (category != null) body["category"] = category;
    if (sort != null) body["sort"] = sort;

    final response = await http.post('$baseApiUrl/shoes/all', body: body);

    if (response.statusCode == 200) {
      List shoes = json.decode(response.body);
      return shoes.map((slider) => ShoesModel.fromJson(slider)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ShoesModel> getDetail({@required String id}) async {
    final response = await http.post('$baseApiUrl/shoes/detail', body: {'id': id});

    if (response.statusCode == 200) {
      ShoesModel shoes = ShoesModel.fromJson(json.decode(response.body));
      return shoes;
    } else {
      throw ServerException();
    }
  }
}