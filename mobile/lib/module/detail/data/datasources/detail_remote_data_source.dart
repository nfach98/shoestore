import 'package:dio/dio.dart';
import 'package:mobile/module/detail/data/models/get_shoes_detail_response_model.dart';

import '../../../../common/constant/api_path_constants.dart';

abstract class DetailRemoteDataSource {
  Future<GetShoesDetailResponseModel> getShoesDetail({required String id});
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final Dio _dio;

  DetailRemoteDataSourceImpl(this._dio);

  @override
  Future<GetShoesDetailResponseModel> getShoesDetail({required String id}) async {
    final res = await _dio.get(
      ApiPathConstants.getShoesDetail,
      queryParameters: {'id': id}
    );
    GetShoesDetailResponseModel responseModel =
    GetShoesDetailResponseModel.fromJson(res.data);
    return responseModel;
  }
}