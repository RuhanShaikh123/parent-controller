import '../datasource/pairing_datasource.dart';

class PairingRepository {
  final PairingDatasource datasource;

  PairingRepository(this.datasource);

  Future<String> generatePairCode() {
    return datasource.generatePairCode();
  }
}