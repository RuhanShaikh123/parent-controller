import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_repository_provider.dart';

final roleProvider = NotifierProvider<RoleNotifier, bool>(RoleNotifier.new);

class RoleNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  String? error;

  Future<bool> saveRole(String role) async {
    state = true;

    error = null;

    try {
      final repository = ref.read(authRepositoryProvider);

      await repository.saveRole(role);

      state = false;

      return true;
    } catch (e) {
      error = e.toString();

      state = false;

      return false;
    }
  }
}
