// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/movie_detail/bloc/bloc.dart';

void main() {
  group('MovieDetailEvent', () {  
    group('CustomMovieDetailEvent', () {
      test('supports value equality', () {
        expect(
          CustomMovieDetailEvent(),
          equals(const CustomMovieDetailEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomMovieDetailEvent(),
          isNotNull
        );
      });
    });
  });
}
