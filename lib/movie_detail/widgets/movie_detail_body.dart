import 'package:flutter/material.dart';
import 'package:movie_app/movie_detail/bloc/bloc.dart';

/// {@template movie_detail_body}
/// Body of the MovieDetailPage.
///
/// Add what it does
/// {@endtemplate}
class MovieDetailBody extends StatelessWidget {
  /// {@macro movie_detail_body}
  const MovieDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state.when(
            loading: () => const Center(
              child: RepaintBoundary(child: CircularProgressIndicator()),
            ),
            loaded: (movie) => Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(movie.poster),
                  ),
                  Text(movie.title),
                  Text(movie.year),
                  Text(movie.plot),
                  Text(movie.director),
                  Text(movie.actors),
                  Text(movie.genre),
                  Text(movie.imdbVotes),
                  Text(movie.language),
                ],
              ),
            ),
            error: (err) => Center(child: Text('$err')),
          ),
        );
      },
    );
  }
}
