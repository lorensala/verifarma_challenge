import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/movie_detail/bloc/bloc.dart';
import 'package:movie_app/movie_detail/widgets/movie_detail_body.dart';
import 'package:omdb/omdb.dart';

/// {@template movie_detail_page}
/// A description for MovieDetailPage
/// {@endtemplate}
class MovieDetailPage extends StatelessWidget {
  /// {@macro movie_detail_page}
  const MovieDetailPage({super.key, required this.movieId});

  final String movieId;

  /// The static route for MovieDetailPage
  static Route<dynamic> route({required String movieId}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MovieDetailPage(movieId: movieId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(
        omdbRepository: GetIt.I.get<OmdbRepository>(),
      )..add(MovieDetailEvent.fetchMovieDetails(movieId)),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: context.colorScheme.onBackground,
          ),
          title: const Text('Movie Details'),
        ),
        body: const MovieDetailView(),
      ),
    );
  }
}

/// {@template movie_detail_view}
/// Displays the Body of MovieDetailView
/// {@endtemplate}
class MovieDetailView extends StatelessWidget {
  /// {@macro movie_detail_view}
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieDetailBody();
  }
}
