import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/gallery_bloc.dart';
import '../bloc/gallery_event.dart';
import '../bloc/gallery_state.dart';
import '../widgets/image_list_view_widget.dart';
import '../widgets/pick_image_button_widget.dart';

/// Gallery screen containing ListView of picked images and "Pick Image" button below it.
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<GalleryBloc, GalleryState>(
                listener: (context, state) {
                  if (state is GalleryErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ImageListViewWidget(images: state.images);
                },
              ),
            ),
            BlocBuilder<GalleryBloc, GalleryState>(
              builder: (context, state) {
                final isLoading = state is GalleryLoadingState;
                return PickImageButtonWidget(
                  isLoading: isLoading,
                  onPressed: () {
                    context.read<GalleryBloc>().add(PickImagesEvent());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
