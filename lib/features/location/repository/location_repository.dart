
import '../data/datasource/location_datasource.dart';

class LocationRepository {

  final LocationDatasource datasource;

  LocationRepository(this.datasource);

  Stream<Map<String, dynamic>> getLocation() {

    return datasource.childLocation().map((doc) {

      return doc.data()!;

    });

  }
}