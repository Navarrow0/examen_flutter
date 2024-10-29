import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:examen_flutter/features/home/domain/providers/user_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final isSearchActiveProvider = StateProvider<bool>((ref) => false);

final isSortDescendingProvider = StateProvider<bool>((ref) => false);

final filteredUsersProvider = Provider<AsyncValue<List<UserDataEntity>>>((ref) {
  final usersAsyncValue = ref.watch(getUsersProvider(null));
  final searchQuery = ref.watch(searchQueryProvider);
  final isSortDescending = ref.watch(isSortDescendingProvider);

  return usersAsyncValue.whenData((userResponse) {

    var users = List<UserDataEntity>.from(userResponse.data);

    if (searchQuery.isNotEmpty) {
      users = users
          .where((user) =>
          user.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    users.sort((a, b) {
      return isSortDescending
          ? b.name.compareTo(a.name)
          : a.name.compareTo(b.name);
    });

    return users;
  });
});
