// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/movie/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MovieBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => MovieBloc(),
          child: MaterialApp(home: MovieBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
