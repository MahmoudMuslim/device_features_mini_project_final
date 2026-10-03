import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/app_constants.dart';
import 'maps_event.dart';
import 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsInitialState()) {
    on<LoadMapEvent>(_onLoadMap);
  }

  void _onLoadMap(LoadMapEvent event, Emitter<MapsState> emit) {
    // Initializing red marker at Cairo Governorate, Egypt
    const cairoLocation = AppConstants.cairoCoordinates;

    final Marker cairoMarker = Marker(
      markerId: const MarkerId('cairo_governorate_marker'),
      position: cairoLocation,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: const InfoWindow(
        title: 'Cairo Governorate',
        snippet: 'Cairo, Egypt',
      ),
    );

    emit(
      MapsLoadedState(initialPosition: cairoLocation, markers: {cairoMarker}),
    );
  }
}
