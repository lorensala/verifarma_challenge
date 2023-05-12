import 'package:authentication/authentication.dart';

extension AuthFailureX on AuthFailure {
  String get message {
    return when(
      emailAlreadyInUse: () => 'Email Already In Use',
      invalidEmailAndPasswordCombination: () =>
          'Invalid Email And Password Combination',
      invalidEmail: () => 'Invalid Email',
      unknown: () => 'Unknown Error',
      weakPassword: () => 'Weak Password',
    );
  }
}
