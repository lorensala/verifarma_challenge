import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/auth/auth.dart';
import 'package:movie_app/l10n/l10n.dart';
import 'package:movie_app/login/login.dart';
import 'package:movie_app/movie/bloc/bloc.dart';
import 'package:movie_app/movie/widgets/movie_body.dart';
import 'package:movie_app/theme/widgets/theme_toggle.dart';
import 'package:omdb/omdb.dart';

/// {@template movie_page}
/// Displays the MoviePage
/// {@endtemplate}
class MoviePage extends StatelessWidget {
  /// {@macro movie_page}
  const MoviePage({super.key});

  /// The static route for MoviePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MoviePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(
        omdbRepository: GetIt.I.get<OmdbRepository>(),
      )..add(const MovieEvent.fetchMovies()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.counterAppBarTitle),
          actions: const [
            ThemeToggle(),
            SignOutButton(),
          ],
        ),
        body: const MovieView(),
      ),
    );
  }
}

/// {@template movie_view}
/// Displays the Body of MovieView
/// {@endtemplate}
class MovieView extends StatelessWidget {
  /// {@macro movie_view}
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          unauthenticated: () => Navigator.of(context).pushAndRemoveUntil<void>(
            LoginPage.route(),
            (route) => false,
          ),
        );
      },
      child: const MovieBody(),
    );
  }
}
