// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/movie/bloc/bloc.dart';

void main() {
  group('MovieEvent', () { 
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomMovieEvent(),
          isNotNull
        );
      });
    });
  });
}
