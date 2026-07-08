import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasource/dashboard_datasource.dart';
import 'dashboard_repository.dart';

final dashboardRepositoryProvider =
Provider((ref){

  return DashboardRepository(
    DashboardDatasource(),
  );

});