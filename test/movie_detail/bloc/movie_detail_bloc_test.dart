// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/movie_detail/bloc/bloc.dart';

void main() {
  group('MovieDetailBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          MovieDetailBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final movieDetailBloc = MovieDetailBloc();
      expect(movieDetailBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<MovieDetailBloc, MovieDetailState>(
      'CustomMovieDetailEvent emits nothing',
      build: MovieDetailBloc.new,
      act: (bloc) => bloc.add(const CustomMovieDetailEvent()),
      expect: () => <MovieDetailState>[],
    );
  });
}
