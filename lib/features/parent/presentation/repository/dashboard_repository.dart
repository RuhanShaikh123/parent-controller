import '../data/datasource/dashboard_datasource.dart';

class DashboardRepository {

  final DashboardDatasource datasource;

  DashboardRepository(this.datasource);

  Future<Map<String,dynamic>> getChild() {

    return datasource.getChild();

  }

} 