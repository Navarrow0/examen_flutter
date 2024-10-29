
import 'package:dartz/dartz.dart';
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:examen_flutter/features/home/domain/repositories/users_repository.dart';

class GetUsersUseCase {
  final UsersRepository repository;

  GetUsersUseCase(this.repository);

  Future<Either<String, UserResponseEntity>> call() {
    return repository.getUsers();
  }
}
