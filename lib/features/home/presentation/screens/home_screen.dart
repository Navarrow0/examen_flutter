import 'package:aura_box/aura_box.dart';
import 'package:examen_flutter/config/app_colors.dart';
import 'package:examen_flutter/features/home/presentation/providers/home_provider.dart';
import 'package:examen_flutter/features/home/presentation/widgets/custom_alert_dialog.dart';
import 'package:examen_flutter/features/home/presentation/widgets/user_info_card.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:examen_flutter/config/app_colors.dart' as config;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearchActive = ref.watch(isSearchActiveProvider);
    final usersAsyncValue = ref.watch(filteredUsersProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCustomDialog(context, ref);
        },
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        child: const Icon(Icons.add_rounded),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: isSearchActive
            ? TextField(
          controller: searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Buscar...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.black),
          ),
          style: const TextStyle(color: AppColors.black),
          onChanged: (value) {
            ref.read(searchQueryProvider.notifier).state = value;
          },
        )
            : const Text('Usuarios'),
        elevation: 0,
        centerTitle: false,
        leading: isSearchActive
            ? IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            searchController.clear();
            ref.read(searchQueryProvider.notifier).state = '';
            ref.read(isSearchActiveProvider.notifier).state = false;
          },
        )
            : null,
        actions: [
          IconButton(
            onPressed: () {
              final isDescending = ref.read(isSortDescendingProvider);
              ref.read(isSortDescendingProvider.notifier).state = !isDescending;
            },
            icon: const Icon(
              FluentIcons.filter_32_filled,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(isSearchActiveProvider.notifier).state = true;
            },
            icon: const Icon(
              FluentIcons.search_48_filled,
              size: 24,
            ),
          ),
        ],
      ),
      body: AuraBox(
        spots: [
          AuraSpot(
            color: config.AppColors.backgroundYellow,
            radius: 250,
            alignment: Alignment.bottomLeft,
            blurRadius: 10.0,
            stops: const [0.0, 0.5],
          ),
          AuraSpot(
            color: config.AppColors.primaryColor,
            radius: 200,
            alignment: Alignment.topCenter,
            blurRadius: 10.0,
            stops: const [0.0, 0.7],
          ),
        ],
        child: SafeArea(
          child: usersAsyncValue.when(
            data: (users) => Column(
              children: [
                Expanded(
                  child: users.isEmpty
                      ? const Center(child: Text('No se encontraron usuarios'))
                      : ListView.separated(
                    itemCount: users.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    separatorBuilder: (_, index) =>
                    const SizedBox(height: 10),
                    itemBuilder: (_, index) {
                      final user = users[index];
                      return UserInfoCard(
                        user: user,
                        onTap: () {
                          showCustomDialog(context, ref, userId: user.id);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
          ),
        ),
      ),
    );
  }
}