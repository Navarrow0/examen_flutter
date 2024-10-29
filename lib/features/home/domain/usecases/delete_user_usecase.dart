
import 'package:dartz/dartz.dart';
import 'package:examen_flutter/features/home/domain/entities/user_operation_response_entity.dart';
import 'package:examen_flutter/features/home/domain/repositories/users_repository.dart';

class DeleteUserUseCase {
  final UsersRepository repository;

  DeleteUserUseCase(this.repository);

  Future<Either<String, UserOperationResponseEntity>> call({required int userId}) {
    return repository.deleteUser(userId: userId);
  }
}
