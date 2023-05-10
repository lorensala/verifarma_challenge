// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/movie/bloc/bloc.dart';

void main() {
  group('MovieState', () {
    test('supports value equality', () {
      expect(
        MovieState(),
        equals(
          const MovieState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const MovieState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const movieState = MovieState(
            customProperty: 'My property',
          );
          expect(
            movieState.copyWith(),
            equals(movieState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const movieState = MovieState(
            customProperty: 'My property',
          );
          final otherMovieState = MovieState(
            customProperty: 'My property 2',
          );
          expect(movieState, isNot(equals(otherMovieState)));

          expect(
            movieState.copyWith(
              customProperty: otherMovieState.customProperty,
            ),
            equals(otherMovieState),
          );
        },
      );
    });
  });
}
