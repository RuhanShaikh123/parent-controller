import 'package:geocoding/geocoding.dart';

class AddressService {
  static Future<String> getAddress(
      double latitude,
      double longitude,
      ) async {
    try {
      final places = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (places.isEmpty) return "Unknown location";

      final p = places.first;

      return "${p.locality}, ${p.administrativeArea}";
    } catch (e) {
      return "Unknown location";
    }
  }
}