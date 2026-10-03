import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapsState extends Equatable {
  const MapsState();

  @override
  List<Object?> get props => [];
}

class MapsInitialState extends MapsState {}

class MapsLoadedState extends MapsState {
  final LatLng initialPosition;
  final Set<Marker> markers;

  const MapsLoadedState({required this.initialPosition, required this.markers});

  @override
  List<Object?> get props => [initialPosition, markers];
}
