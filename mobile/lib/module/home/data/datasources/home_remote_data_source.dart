import 'package:dio/dio.dart';
import 'package:mobile/common/constant/api_path_constants.dart';
import 'package:mobile/module/home/data/models/get_shoes_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<GetShoesResponseModel> getShoes({int? page, String? search});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<GetShoesResponseModel> getShoes({int? page, String? search}) async {
    final Map<String, dynamic> query = {};
    if (page != null) {
      query['page'] = page;
    } if (search != null) {
      query['search'] = search;
    }

    final res = await _dio.get(
      ApiPathConstants.getShoes,
      queryParameters: query
    );
    GetShoesResponseModel responseModel =
        GetShoesResponseModel.fromJson(res.data);
    return responseModel;
  }
}
