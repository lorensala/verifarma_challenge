import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthenticationRepository authenticationRepository})
      : _repository = authenticationRepository,
        super(
          authenticationRepository.user
              .fold(AuthState.unauthenticated, AuthState.authenticated),
        ) {
    on<LogoutRequestedEvent>(_onLogoutRequested);
    on<ListenUser>(_onListenUser);

    add(const ListenUser());
  }
  final AuthenticationRepository _repository;

  Future<void> _onListenUser(ListenUser event, Emitter<AuthState> emit) async {
    await emit.forEach(
      _repository.userStream,
      onData: (user) {
        if (user == null) {
          return const AuthState.unauthenticated();
        } else {
          return AuthState.authenticated(user);
        }
      },
      onError: (error, _) => const AuthState.unauthenticated(),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async =>
      unawaited(_repository.logout());
}
