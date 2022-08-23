import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/common/errors/app_error.dart';
import 'package:mobile/module/detail/data/datasources/detail_remote_data_source.dart';
import 'package:mobile/module/detail/data/mappers/detail_mapper.dart';
import 'package:mobile/module/detail/domain/entities/get_shoes_detail_entity.dart';

import '../../../../common/errors/socket_error.dart';
import '../../domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource _remoteDataSource;

  DetailRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppError, GetShoesDetailEntity>> getShoesDetail({required String id}) async {
    try {
      final result = await _remoteDataSource.getShoesDetail(id: id);
      return Right(DetailMapper.toGetShoesDetailEntity(result));
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        return const Left(SocketError());
      } else if (e.type == DioErrorType.response) {
        return Left(AppError(e.response?.data['message']));
      }

      return Left(AppError(e.response?.data?['message']));
    } on SocketException catch (_) {
      return const Left(SocketError());
    }
  }
}