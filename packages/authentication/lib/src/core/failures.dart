// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unknown() = _Unknown;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.invalidEmail() = _InvalidEmail;
  const factory AuthFailure.weakPassword() = _WeakPassword;
}
