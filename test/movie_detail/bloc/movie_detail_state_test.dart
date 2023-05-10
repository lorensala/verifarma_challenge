// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/movie_detail/bloc/bloc.dart';

void main() {
  group('MovieDetailState', () {
    test('supports value equality', () {
      expect(
        MovieDetailState(),
        equals(
          const MovieDetailState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const MovieDetailState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const movieDetailState = MovieDetailState(
            customProperty: 'My property',
          );
          expect(
            movieDetailState.copyWith(),
            equals(movieDetailState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const movieDetailState = MovieDetailState(
            customProperty: 'My property',
          );
          final otherMovieDetailState = MovieDetailState(
            customProperty: 'My property 2',
          );
          expect(movieDetailState, isNot(equals(otherMovieDetailState)));

          expect(
            movieDetailState.copyWith(
              customProperty: otherMovieDetailState.customProperty,
            ),
            equals(otherMovieDetailState),
          );
        },
      );
    });
  });
}
