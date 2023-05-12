import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/register/cubit/cubit.dart';
import 'package:movie_app/register/widgets/register_body.dart';

/// {@template register_page}
/// A description for RegisterPage
/// {@endtemplate}
class RegisterPage extends StatelessWidget {
  /// {@macro register_page}
  const RegisterPage({super.key});

  /// The static route for RegisterPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(repository: GetIt.I.get<AuthenticationRepository>()),
      child: const Scaffold(
        body: RegisterView(),
      ),
    );
  }
}

/// {@template register_view}
/// Displays the Body of RegisterView
/// {@endtemplate}
class RegisterView extends StatelessWidget {
  /// {@macro register_view}
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterBody();
  }
}
