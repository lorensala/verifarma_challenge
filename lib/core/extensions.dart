import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

extension EitherX<L, R> on Either<L, R> {
  R get rightValue => fold((_) => throw Exception('No right value'), (r) => r);
  L get leftValue => fold((l) => l, (_) => throw Exception('No left value'));
}

extension ScrollControllerX on ScrollController {
  bool get isAtBottom => position.pixels == position.maxScrollExtent;
}

extension BuildContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension StringX on String {
  String get capizalize => '${this[0].toUpperCase()}${substring(1)}';
}
