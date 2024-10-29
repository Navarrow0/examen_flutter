

import 'package:dio/dio.dart';
import 'package:examen_flutter/features/home/data/datasource/users_remote_datasource.dart';
import 'package:examen_flutter/features/home/data/repositories/users_repository_impl.dart';
import 'package:examen_flutter/features/home/domain/entities/user_operation_response_entity.dart';
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:examen_flutter/features/home/domain/repositories/users_repository.dart';
import 'package:examen_flutter/features/home/domain/usecases/create_user_usecase.dart';
import 'package:examen_flutter/features/home/domain/usecases/delete_user_usecase.dart';
import 'package:examen_flutter/features/home/domain/usecases/get_user_by_id_usecase.dart';
import 'package:examen_flutter/features/home/domain/usecases/get_users_usecase.dart';
import 'package:examen_flutter/features/home/domain/usecases/update_user_usecase.dart';
import 'package:examen_flutter/shared/network/dio_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersRemoteDataSourceProvider = Provider.family<UsersRemoDataSource, Dio>(
      (_, dio) => UsersRemoDataSource(dio),
);

final usersRepositoryProvider = Provider.family<UsersRepository, bool?>(
      (ref, loading) {
    final dio = ref.watch(dioNetworkProvider(loading));
    final datasource = ref.watch(usersRemoteDataSourceProvider(dio));
    return UsersRepositoryImpl(datasource);
  },
);

final getUsersUseCaseProvider = Provider<GetUsersUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider(false));
  return GetUsersUseCase(repository);
});

final getUserByIdUseCaseProvider = Provider((ref) {
  final repository = ref.watch(usersRepositoryProvider(false));
  return GetUserByIdUseCase(repository);
});

final createUserUseCaseProvider = Provider<CreateUserUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider(false));
  return CreateUserUseCase(repository);
});

final updateUserUseCaseProvider = Provider<UpdateUserUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider(false));
  return UpdateUserUseCase(repository);
});

final deleteUserUseCaseProvider = Provider<DeleteUserUseCase>((ref) {
  final repository = ref.watch(usersRepositoryProvider(false));
  return DeleteUserUseCase(repository);
});

final getUsersProvider = FutureProvider.family<UserResponseEntity, bool?>(
      (ref, loading) async {
    final useCase = ref.watch(getUsersUseCaseProvider);
    final result = await useCase();

    return result.fold(
          (failure) => throw Exception(failure),
          (userResponse) => userResponse,
    );
  },
);

final userByIdProvider =
FutureProvider.autoDispose.family<UserOperationResponseEntity, int>((ref, id) async {
  final useCase = ref.watch(getUserByIdUseCaseProvider);
  final result = await useCase(userId: id);

  return result.fold(
        (failure) => throw Exception(failure),
        (user) => user,
  );
});