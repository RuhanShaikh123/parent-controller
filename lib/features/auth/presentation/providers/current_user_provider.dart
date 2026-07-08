import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/ models/user_model.dart';
import '../../data/repository/auth_repository_provider.dart';

final currentUserProvider =
FutureProvider<UserModel>((ref) async {

  final repo = ref.read(authRepositoryProvider);

  return repo.getCurrentUser();
});