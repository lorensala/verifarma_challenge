// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/movie/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MoviePage', () {
    group('route', () {
      test('is routable', () {
        expect(MoviePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MovieView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MoviePage()));
      expect(find.byType(MovieView), findsOneWidget);
    });
  });
}
