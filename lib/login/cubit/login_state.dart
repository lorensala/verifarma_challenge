// ignore_for_file: strict_raw_type

part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState, FormzMixin {
  const factory LoginState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    AuthFailure? failure,
    @Default(true) bool isPasswordObscure,
  }) = _LoginState;

  const LoginState._();

  @override
  List<FormzInput> get inputs => [email, password];
}
