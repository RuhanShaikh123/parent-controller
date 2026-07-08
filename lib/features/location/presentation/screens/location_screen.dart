import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/location_provider.dart';
import '../../services/address_service.dart';

class LiveLocationScreen extends ConsumerStatefulWidget {
  const LiveLocationScreen({super.key});

  @override
  ConsumerState<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends ConsumerState<LiveLocationScreen> {

  final MapController mapController = MapController();

  Future<void> openNavigation(
      double latitude,
      double longitude,
      ) async {

    final Uri uri = Uri.parse(
      "https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude",
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }


  String address = "Loading location...";

  Future<void> _loadAddress(double latitude, double longitude) async {
    final result = await AddressService.getAddress(latitude, longitude);

    if (mounted) {
      setState(() {
        address = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationProvider);

    return location.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),

      error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),

      data: (data) {
        final latitude = (data["latitude"] as num).toDouble();

        final longitude = (data["longitude"] as num).toDouble();

        Future.microtask(() {
          mapController.move(
            LatLng(latitude, longitude),
            mapController.camera.zoom,
          );
        });

        return Scaffold(
          body: Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: LatLng(latitude, longitude),

                  initialZoom: 16,
                ),

                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",

                    userAgentPackageName: "com.example.parent_controller",
                  ),

                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(latitude, longitude),

                        width: 80,

                        height: 80,

                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Positioned(
                right: 20,
                bottom: 240,
                child: FloatingActionButton(
                  heroTag: "center",
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    mapController.move(
                      LatLng(latitude, longitude),
                      17,
                    );
                  },
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(blurRadius: 15, color: Colors.black12),
                            ],
                          ),
                          child: Text(
                            "${data["firstName"]}'s Live Location",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 20,

                left: 16,

                right: 16,

                child: Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(24),

                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 18,

                        color: Colors.black12,

                        offset: Offset(0, 6),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,

                            backgroundColor: Colors.blue.shade100,

                            child: Text(
                              data["firstName"][0].toUpperCase(),

                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "${data["firstName"]} ${data["lastName"]}",

                                  style: const TextStyle(
                                    fontSize: 20,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  data["deviceName"] ?? "Android Device",

                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.red),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              address,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 12,
                          ),

                          const SizedBox(width: 8),

                          const Text(
                            "Connected",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),

                          const Spacer(),

                          Text(
                            "Live",
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,

                        child: FilledButton.icon(
                          onPressed: () {
                            openNavigation(
                              latitude,
                              longitude,
                            );
                          },

                          icon: const Icon(Icons.navigation),

                          label: const Text("Navigate"),

                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.blue,

                            foregroundColor: Colors.white,

                            padding: const EdgeInsets.symmetric(vertical: 16),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
