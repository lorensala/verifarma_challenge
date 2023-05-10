// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/movie/bloc/bloc.dart';

void main() {
  group('MovieBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          MovieBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final movieBloc = MovieBloc();
      expect(movieBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<MovieBloc, MovieState>(
      'CustomMovieEvent emits nothing',
      build: MovieBloc.new,
      act: (bloc) => bloc.add(const CustomMovieEvent()),
      expect: () => <MovieState>[],
    );
  });
}
