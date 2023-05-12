import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/login/login.dart';
import 'package:movie_app/movie/movie.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _EmailInput(),
        SizedBox(height: 16),
        _PasswordInput(),
        SizedBox(height: 25),
        _ForgotPassword(),
        SizedBox(height: 25),
        _LoginButton(),
      ],
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot password?',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return TextField(
          onChanged: cubit.passwordChanged,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: state.password.error == null
                ? null
                : state.password.error!.when(
                    invalid: () => 'Invalid password',
                    empty: () => 'Password is empty',
                    tooShort: () => 'Password too short',
                  ),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: Sizes.large,
              maxWidth: Sizes.large + Sizes.small,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: Sizes.small),
              child: GestureDetector(
                onTap: cubit.togglePasswordObscure,
                child: SizedBox(
                  child: SvgPicture.asset(
                    state.isPasswordObscure ? Vectors.eyeOff : Vectors.eye,
                    colorFilter: ColorFilter.mode(
                      context.colorScheme.onBackground,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          obscureText: state.isPasswordObscure,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: cubit.emailChanged,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Email',
            errorText: state.email.error == null
                ? null
                : state.email.error!.when(
                    invalid: () => 'Invalid email',
                    empty: () => 'Email is empty',
                  ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.status != current.status && current.status.isFailure,
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).push(MoviePage.route());
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.failure.toString()),
              ),
            );
        }
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        final isValid = state.isValid;
        final isLoading = state.status.isInProgress;
        return ElevatedButton(
          onPressed: isValid ? cubit.logInWithEmailAndPassword : null,
          child: const Text('Login'),
        );
      },
    );
  }
}
