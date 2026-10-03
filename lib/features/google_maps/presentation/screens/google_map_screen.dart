import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/maps_bloc.dart';
import '../bloc/maps_event.dart';
import '../bloc/maps_state.dart';
import '../widgets/map_view_widget.dart';

/// Screen displaying full-screen Google Map with title "Google Map" in AppBar.
class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MapsBloc>().add(LoadMapEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Map')),
      body: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          if (state is MapsLoadedState) {
            return MapViewWidget(
              initialPosition: state.initialPosition,
              markers: state.markers,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
