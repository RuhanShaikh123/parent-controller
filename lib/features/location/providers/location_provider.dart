import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/location_repository_provider.dart';

final locationProvider =
StreamProvider<Map<String, dynamic>>((ref) {

  return ref
      .read(locationRepositoryProvider)
      .getLocation();

});