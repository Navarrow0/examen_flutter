
import 'package:dartz/dartz.dart';
import 'package:examen_flutter/features/home/domain/entities/user_operation_response_entity.dart';
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:examen_flutter/features/home/domain/repositories/users_repository.dart';

class CreateUserUseCase {
  final UsersRepository repository;

  CreateUserUseCase(this.repository);

  Future<Either<String, UserOperationResponseEntity>> call({required UserDataEntity data}) {
    return repository.createUser(data: data);
  }
}
