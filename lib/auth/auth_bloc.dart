import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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
    on<UserChanged>(_onUserChanged);

    on<LogoutRequestedEvent>(_onLogoutRequested);

    // _userAuthSubscription = _repository.userAuthStateChanged.listen((user) {
    //   add(UserChanged(user));
    // });
  }
  final AuthenticationRepository _repository;
  late final StreamSubscription<Option<User>> _userAuthSubscription;
  late final StreamSubscription<Option<User>> _userChangesSubscription;

  void _onUserChanged(UserChanged event, Emitter<AuthState> emit) =>
      event.user.fold(
        () => emit(const AuthState.unauthenticated()),
        (user) => emit(AuthState.authenticated(user)),
      );

  Future<void> _onLogoutRequested(
    LogoutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async =>
      unawaited(_repository.logout());

  @override
  Future<void> close() {
    _userAuthSubscription.cancel();
    _userChangesSubscription.cancel();
    return super.close();
  }
}
