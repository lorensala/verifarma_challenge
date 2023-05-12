// ignore_for_file: strict_raw_type

part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState, FormzMixin {
  const factory RegisterState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    AuthFailure? failure,
    @Default(true) bool isPasswordObscure,
  }) = _LoginState;

  const RegisterState._();

  @override
  List<FormzInput> get inputs => [email, password];
}
