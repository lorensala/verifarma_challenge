// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/movie_detail/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieDetailPage', () {
    group('route', () {
      test('is routable', () {
        expect(MovieDetailPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MovieDetailView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MovieDetailPage()));
      expect(find.byType(MovieDetailView), findsOneWidget);
    });
  });
}
