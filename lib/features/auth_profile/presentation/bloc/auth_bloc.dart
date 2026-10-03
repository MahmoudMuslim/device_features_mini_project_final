import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitialState()) {
    on<AuthenticateUserEvent>(_onAuthenticateUser);
    on<ResetAuthStatusEvent>(_onResetAuthStatus);
  }

  Future<void> _onAuthenticateUser(
    AuthenticateUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthAuthenticatingState());
    try {
      final authenticated = await repository.authenticate();
      if (authenticated) {
        emit(AuthSuccessState());
      } else {
        emit(
          const AuthFailureState(
            errorMessage: 'Fingerprint authentication cancelled or failed.',
          ),
        );
      }
    } catch (e) {
      emit(
        AuthFailureState(errorMessage: 'Authentication error: ${e.toString()}'),
      );
    }
  }

  void _onResetAuthStatus(ResetAuthStatusEvent event, Emitter<AuthState> emit) {
    emit(AuthInitialState());
  }
}
