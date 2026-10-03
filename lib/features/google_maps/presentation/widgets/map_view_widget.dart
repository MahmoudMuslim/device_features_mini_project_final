import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/app_constants.dart';

/// Full-screen Google Map widget displaying marker at Cairo Governorate.
class MapViewWidget extends StatelessWidget {
  final LatLng initialPosition;
  final Set<Marker> markers;

  const MapViewWidget({
    super.key,
    required this.initialPosition,
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: initialPosition,
        zoom: AppConstants.defaultMapZoom,
      ),
      markers: markers,
      myLocationEnabled: false,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
    );
  }
}
