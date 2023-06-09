import 'package:flutter/material.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/login/cubit/cubit.dart';
import 'package:movie_app/login/widgets/widgets.dart';
import 'package:movie_app/register/view/register_page.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatelessWidget {
  /// {@macro login_body}
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.medium),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Welcome back!', style: context.textTheme.headlineLarge),
                  const SizedBox(height: Sizes.large),
                  const LoginForm(),
                  const SizedBox(height: Sizes.large),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      RegisterPage.route(),
                      (route) => false,
                    ),
                    child: const Text('Create an account'),
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
