import 'package:flutter/material.dart';
import 'package:movie_app/movie/movie.dart';

/// {@template movie_body}
/// Body of the MoviePage.
///
/// Add what it does
/// {@endtemplate}
class MovieBody extends StatelessWidget {
  /// {@macro movie_body}
  const MovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieList();
  }
}
