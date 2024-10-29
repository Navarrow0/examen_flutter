

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:examen_flutter/features/home/data/api/user_api.dart';
import 'package:examen_flutter/features/home/data/models/user_operation_response_model.dart';
import 'package:examen_flutter/features/home/data/models/user_request_model.dart';
import 'package:examen_flutter/features/home/data/models/users_response_model.dart';
import 'package:examen_flutter/shared/network/response_handler.dart';

class UsersRemoDataSource{

  final Dio dio;
  UsersRemoDataSource(this.dio);

  Future<Either<String, UsersResponseModel>> getUsers() async {
    try {
      final response = await dio.get(UserApi.userEndpoint,);
      return ResponseHandler.handle(response, (json) => UsersResponseModel.fromJson(json));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserOperationResponseModel>> createUser({required UserRequestModel data}) async {
    try {
      final response = await dio.post(UserApi.userEndpoint, data: data.toJson());
      return ResponseHandler.handle(response, (json) => UserOperationResponseModel.fromJson(json));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserOperationResponseModel>> updateUser({required UserRequestModel data, required int userId}) async {
    try {
      final response = await dio.put('${UserApi.userEndpoint}$userId', data: data.toJson());
      return ResponseHandler.handle(response, (json) => UserOperationResponseModel.fromJson(json));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserOperationResponseModel>> deleteUser({required int userId}) async {
    try {
      final response = await dio.delete('${UserApi.userEndpoint}$userId');
      return ResponseHandler.handle(response, (json) => UserOperationResponseModel.fromJson(json));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserOperationResponseModel>> getUserById({required int userId}) async {
    try {
      final response = await dio.get('${UserApi.userEndpoint}$userId');
      return ResponseHandler.handle(response, (json) => UserOperationResponseModel.fromJson(json));
    } catch (e) {
      return Left(e.toString());
    }
  }
}