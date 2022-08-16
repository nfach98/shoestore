import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/common/errors/app_error.dart';
import 'package:mobile/module/home/data/datasources/home_remote_data_source.dart';
import 'package:mobile/module/home/data/mappers/home_mapper.dart';
import 'package:mobile/module/home/domain/entities/get_shoes_entity.dart';
import 'package:mobile/module/home/domain/repositories/home_repository.dart';

import '../../../../common/errors/socket_error.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppError, GetShoesEntity>> getShoes({int? page}) async {
    try {
      final result = await _remoteDataSource.getShoes(page: page);
      return Right(HomeMapper.toGetShoesEntity(result));
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