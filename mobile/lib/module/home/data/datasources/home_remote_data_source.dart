import 'package:dio/dio.dart';
import 'package:mobile/common/constant/api_path_constants.dart';
import 'package:mobile/module/home/data/models/get_shoes_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<GetShoesResponseModel> getShoes({int? page});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<GetShoesResponseModel> getShoes({int? page}) async {
    final res = await _dio.get(ApiPathConstants.getShoes(page: page));
    GetShoesResponseModel responseModel =
        GetShoesResponseModel.fromJson(res.data);
    return responseModel;
  }
}
