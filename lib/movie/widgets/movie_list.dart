import 'package:flutter/material.dart';
import 'package:movie_app/core/core.dart';
import 'package:movie_app/movie/movie.dart';

class MovieList extends StatefulWidget {
  const MovieList({
    super.key,
  });

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            return ListView.separated(
              controller: _scrollController,
              itemCount: movies.length + 1,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                if (index == movies.length) {
                  return const Center(
                    child: RepaintBoundary(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final movie = movies[index];

                return MovieListItem(movie: movie);
              },
            );
          },
          error: (err) => Text('$err'),
        );
      },
    );
  }
}
