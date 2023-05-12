part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logoutRequestedEvent() = LogoutRequestedEvent;
  const factory AuthEvent.listenUser() = ListenUser;
}
