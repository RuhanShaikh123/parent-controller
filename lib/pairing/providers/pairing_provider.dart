import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/pairing_repository_provider.dart';



final pairingProvider =
AsyncNotifierProvider<PairingNotifier, String?>(
    PairingNotifier.new);

class PairingNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    return null;
  }

  Future<void> generateCode() async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(pairingRepositoryProvider);

      final code = await repository.generatePairCode();

      state = AsyncData(code);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}