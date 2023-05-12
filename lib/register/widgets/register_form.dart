import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:movie_app/auth/auth.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/movie/movie.dart';
import 'package:movie_app/register/cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _EmailInput(),
        SizedBox(height: Sizes.medium),
        _PasswordInput(),
        SizedBox(height: Sizes.large),
        _RegisterButton(),
      ],
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final showError = !state.password.isPure &&
            state.password.value.isNotEmpty &&
            state.password.isNotValid;

        return TextField(
          onChanged: cubit.passwordChanged,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: 'Password',
            errorMaxLines: 2,
            errorText: showError
                ? state.password.error!.when(
                    invalid: () =>
                        'Password must contain at least 8 characters and include at least one number',
                    empty: () => 'Password is empty',
                    tooShort: () => 'Password too short',
                  )
                : null,
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
    final cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final showError = !state.email.isPure &&
            state.email.value.isNotEmpty &&
            state.email.isNotValid;

        return TextField(
          onChanged: cubit.emailChanged,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Email',
            errorText: showError
                ? state.email.error!.when(
                    invalid: () => 'Invalid email',
                    empty: () => 'Email is empty',
                  )
                : null,
          ),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context)
              .pushAndRemoveUntil(MoviePage.route(), (route) => false);
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.failure!.message),
              ),
            );
        }
      },
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        final isValid = state.isValid && !state.status.isInProgress;

        return ElevatedButton(
          onPressed: isValid ? cubit.registerWithEmailAndPassword : null,
          child: const Text('Register'),
        );
      },
    );
  }
}
