// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/omdb.dart';

void main() {
  group('Omdb', () {
    test('can be instantiated', () {
      expect(Omdb(), isNotNull);
    });
  });
}
