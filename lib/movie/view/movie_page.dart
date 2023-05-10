import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/bloc/bloc.dart';
import 'package:movie_app/movie/widgets/movie_body.dart';
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
        appBar: AppBar(),
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
    return const MovieBody();
  }
}
