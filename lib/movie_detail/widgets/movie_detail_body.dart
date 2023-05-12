import 'package:flutter/material.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/movie_detail/bloc/bloc.dart';
import 'package:movie_app/movie_detail/widgets/widgets.dart';

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
        return state.when(
          loading: () => const Center(
            child: RepaintBoundary(child: CircularProgressIndicator()),
          ),
          loaded: (movie) => Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MoviePoster(movie: movie),
                  const SizedBox(height: Sizes.medium),
                  MovieDetailItem(title: 'Title', content: movie.title),
                  MovieDetailItem(
                    title: 'Plot',
                    content: movie.plot,
                  ),
                  MovieDetailItem(
                    title: 'Genre',
                    content: movie.genre,
                  ),
                  MovieDetailItem(title: 'Year', content: movie.year),
                  MovieDetailItem(title: 'Country', content: movie.country),
                  MovieDetailItem(
                    title: 'IMDB Votes',
                    content: movie.imdbVotes,
                  ),
                  MovieDetailItem(
                    title: 'IMDB Rating',
                    content: movie.imdbRating,
                  ),
                  MovieDetailItem(
                    title: 'Actors',
                    content: movie.actors.join('\n'),
                  ),
                  MovieDetailItem(
                    title: 'Ratings',
                    content: movie.ratings.join('\n'),
                  ),
                  MovieDetailItem(
                    title: 'Awards',
                    content: movie.awards,
                  ),
                  MovieDetailItem(
                    title: 'Language/s',
                    content: movie.language,
                  ),
                  MovieDetailItem(
                    title: 'Release Date',
                    content: movie.released,
                  ),
                ],
              ),
            ),
          ),
          error: (err) => Center(child: Text('Ocurrío un error: $err')),
        );
      },
    );
  }
}
