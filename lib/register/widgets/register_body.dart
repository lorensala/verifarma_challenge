import 'package:flutter/material.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/login/view/login_page.dart';
import 'package:movie_app/register/cubit/cubit.dart';
import 'package:movie_app/register/widgets/register_form.dart';

/// {@template register_body}
/// Body of the RegisterPage.
///
/// Add what it does
/// {@endtemplate}
class RegisterBody extends StatelessWidget {
  /// {@macro register_body}
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.medium),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create account',
                    style: context.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: Sizes.large),
                  const RegisterForm(),
                  const SizedBox(height: Sizes.large),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      LoginPage.route(),
                      (route) => false,
                    ),
                    child: const Text('Already have an account?'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
