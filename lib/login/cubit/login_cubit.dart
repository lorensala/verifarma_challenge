import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthenticationRepository authenticationRepository})
      : _repository = authenticationRepository,
        super(const LoginState());
  final AuthenticationRepository _repository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  void togglePasswordObscure() {
    emit(
      state.copyWith(
        isPasswordObscure: !state.isPasswordObscure,
      ),
    );
  }

  Future<void> logInWithEmailAndPassword() async {
    if (state.email.value.isEmpty || state.password.value.isEmpty) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final possibleFailure = await _repository.loginWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
    );

    possibleFailure.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: failure,
        ),
      ),
      (_) => emit(
        state.copyWith(status: FormzSubmissionStatus.success),
      ),
    );
  }
}
