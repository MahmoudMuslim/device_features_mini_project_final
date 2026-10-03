import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

abstract class AuthLocalDataSource {
  Future<bool> authenticateWithBiometrics();
  Future<bool> canCheckBiometrics();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalAuthentication localAuth;

  AuthLocalDataSourceImpl({required this.localAuth});

  @override
  Future<bool> canCheckBiometrics() async {
    try {
      final bool canAuthenticateWithBiometrics =
          await localAuth.canCheckBiometrics;
      final bool isDeviceSupported = await localAuth.isDeviceSupported();
      return canAuthenticateWithBiometrics || isDeviceSupported;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> authenticateWithBiometrics() async {
    try {
      // Local authentication fingerprint prompt using local_auth package
      return await localAuth.authenticate(
        localizedReason:
            'Please scan your fingerprint to access your secure profile',
        biometricOnly: false,
        persistAcrossBackgrounding: true,
      );
    } on PlatformException catch (e) {
      throw Exception('Biometric authentication failed: ${e.message}');
    }
  }
}
