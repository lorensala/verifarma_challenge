// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/movie_detail/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieDetailBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => MovieDetailBloc(),
          child: MaterialApp(home: MovieDetailBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
