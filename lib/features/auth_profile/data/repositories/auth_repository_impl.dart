import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> authenticate() {
    return localDataSource.authenticateWithBiometrics();
  }

  @override
  Future<bool> canAuthenticate() {
    return localDataSource.canCheckBiometrics();
  }
}
