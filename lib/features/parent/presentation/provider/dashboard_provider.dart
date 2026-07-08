import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/dashboard_repository_provider.dart';

final dashboardProvider =
FutureProvider<Map<String,dynamic>>((ref){

  return ref
      .read(dashboardRepositoryProvider)
      .getChild();

});

