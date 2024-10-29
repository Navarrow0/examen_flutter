import 'package:dartz/dartz.dart';
import 'package:examen_flutter/features/home/data/datasource/users_remote_datasource.dart';
import 'package:examen_flutter/features/home/domain/entities/user_operation_response_entity.dart';
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:examen_flutter/features/home/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoDataSource remoteDataSource;

  UsersRepositoryImpl(this.remoteDataSource);
  
  @override
  Future<Either<String, UserResponseEntity>> getUsers() async {
   
    final result = await remoteDataSource.getUsers();
    return result.fold(
      (l) => Left(
        l,
      ),
      (r) => Right(
        r.toEntity()
      ),
    );
  }

  @override
  Future<Either<String, UserOperationResponseEntity>> createUser({required UserDataEntity data}) async {
    final result = await remoteDataSource.createUser(data: data.toModel());
    return result.fold(
          (l) => Left(
        l,
      ),
          (r) => Right(
          r.toEntity()
      ),
    );
  }

  @override
  Future<Either<String, UserOperationResponseEntity>> updateUser({required UserDataEntity data, required int userId}) async {
    final result = await remoteDataSource.updateUser(data: data.toModel(), userId: userId);
    return result.fold(
          (l) => Left(
        l,
      ),
          (r) => Right(
          r.toEntity()
      ),
    );
  }

  @override
  Future<Either<String, UserOperationResponseEntity>> deleteUser({required int userId}) async {
    final result = await remoteDataSource.deleteUser(userId: userId);
    return result.fold(
          (l) => Left(
        l,
      ),
          (r) => Right(
          r.toEntity()
      ),
    );
  }

  @override
  Future<Either<String, UserOperationResponseEntity>> getUserById({required int userId}) async {
    final result = await remoteDataSource.getUserById(userId: userId);
    return result.fold(
          (l) => Left(
        l,
      ),
          (r) => Right(
          r.toEntity()
      ),
    );
  }
}
