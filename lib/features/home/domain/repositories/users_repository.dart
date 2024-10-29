import 'package:dartz/dartz.dart';
import 'package:examen_flutter/features/home/domain/entities/user_operation_response_entity.dart';
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';

abstract class UsersRepository {
  Future<Either<String, UserResponseEntity>> getUsers();
  Future<Either<String, UserOperationResponseEntity>> getUserById({required int userId});
  Future<Either<String, UserOperationResponseEntity>> createUser({required UserDataEntity data});
  Future<Either<String, UserOperationResponseEntity>> updateUser({required UserDataEntity data, required int userId});
  Future<Either<String, UserOperationResponseEntity>> deleteUser({required int userId});
}