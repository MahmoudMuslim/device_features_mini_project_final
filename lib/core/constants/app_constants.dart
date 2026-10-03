import 'package:google_maps_flutter/google_maps_flutter.dart';

/// App-wide constants including map initial location and defaults.
class AppConstants {
  // Cairo Governorate coordinates for Google Maps
  static const LatLng cairoCoordinates = LatLng(30.0444, 31.2357);
  static const double defaultMapZoom = 12.0;

  // Static Profile Data
  static const String dummyProfileName = 'Mahmoud Al-Sayed';
  static const String dummyProfileEmail = 'mahmoud.developer@example.com';
  static const String dummyProfileImage =
      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=400';
}
