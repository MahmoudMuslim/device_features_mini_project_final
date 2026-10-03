import 'package:audioplayers/audioplayers.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:record/record.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

import 'features/audio_recorder/data/datasources/audio_local_datasource.dart';
import 'features/audio_recorder/data/repositories/audio_repository_impl.dart';
import 'features/audio_recorder/presentation/bloc/audio_bloc.dart';

import 'features/auth_profile/data/datasources/auth_local_datasource.dart';
import 'features/auth_profile/data/repositories/auth_repository_impl.dart';
import 'features/auth_profile/presentation/bloc/auth_bloc.dart';

import 'features/device_info/data/datasources/device_info_local_datasource.dart';
import 'features/device_info/data/repositories/device_info_repository_impl.dart';
import 'features/device_info/presentation/bloc/device_info_bloc.dart';
import 'features/device_info/presentation/bloc/device_info_event.dart';

import 'features/google_maps/presentation/bloc/maps_bloc.dart';

import 'features/media_gallery/data/datasources/gallery_local_datasource.dart';
import 'features/media_gallery/data/repositories/gallery_repository_impl.dart';
import 'features/media_gallery/presentation/bloc/gallery_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate core plugins
    final deviceInfoPlugin = DeviceInfoPlugin();
    final imagePickerPlugin = ImagePicker();
    final localAuthPlugin = LocalAuthentication();
    final audioRecorderPlugin = AudioRecorder();
    final audioPlayerPlugin = AudioPlayer();

    // Data sources
    final deviceInfoDataSource = DeviceInfoLocalDataSourceImpl(
      deviceInfoPlugin: deviceInfoPlugin,
    );
    final galleryDataSource = GalleryLocalDataSourceImpl(
      imagePicker: imagePickerPlugin,
    );
    final authDataSource = AuthLocalDataSourceImpl(localAuth: localAuthPlugin);
    final audioDataSource = AudioLocalDataSourceImpl(
      recorder: audioRecorderPlugin,
      player: audioPlayerPlugin,
    );

    // Repositories
    final deviceInfoRepo = DeviceInfoRepositoryImpl(
      localDataSource: deviceInfoDataSource,
    );
    final galleryRepo = GalleryRepositoryImpl(
      localDataSource: galleryDataSource,
    );
    final authRepo = AuthRepositoryImpl(localDataSource: authDataSource);
    final audioRepo = AudioRepositoryImpl(localDataSource: audioDataSource);

    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceInfoBloc>(
          create: (_) =>
              DeviceInfoBloc(repository: deviceInfoRepo)
                ..add(LoadDeviceInfoEvent()),
        ),
        BlocProvider<GalleryBloc>(
          create: (_) => GalleryBloc(repository: galleryRepo),
        ),
        BlocProvider<MapsBloc>(create: (_) => MapsBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(repository: authRepo)),
        BlocProvider<AudioBloc>(
          create: (_) => AudioBloc(repository: audioRepo),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Device Features',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
