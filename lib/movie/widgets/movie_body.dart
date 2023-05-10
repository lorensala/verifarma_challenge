import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions.dart';
import 'package:movie_app/movie/bloc/bloc.dart';
import 'package:movie_app/movie_detail/movie_detail.dart';

/// {@template movie_body}
/// Body of the MoviePage.
///
/// Add what it does
/// {@endtemplate}
class MovieBody extends StatefulWidget {
  /// {@macro movie_body}
  const MovieBody({super.key});

  @override
  State<MovieBody> createState() => _MovieBodyState();
}

class _MovieBodyState extends State<MovieBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.isAtBottom) {
        context.read<MovieBloc>().add(const MovieEvent.fetchMoreMovies());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(
            child: RepaintBoundary(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (movies) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: movies.length + 1,
              itemBuilder: (context, index) {
                if (index == movies.length) {
                  return const Center(
                    child: RepaintBoundary(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final movie = movies[index];

                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.year),
                  onTap: () => Navigator.of(context)
                      .push(MovieDetailPage.route(movieId: movie.imdbId)),
                );
              },
            );
          },
          error: (err) => Text('$err'),
        );
      },
    );
  }
}
