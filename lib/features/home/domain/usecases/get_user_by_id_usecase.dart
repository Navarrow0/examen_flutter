import 'package:dartz/dartz.dart';
import 'package:examen_flutter/features/home/domain/entities/user_operation_response_entity.dart';
import 'package:examen_flutter/features/home/domain/repositories/users_repository.dart';

class GetUserByIdUseCase {
  final UsersRepository repository;

  GetUserByIdUseCase(this.repository);

  Future<Either<String, UserOperationResponseEntity>> call({required int userId}) {
    return repository.getUserById(userId: userId);
  }
}
