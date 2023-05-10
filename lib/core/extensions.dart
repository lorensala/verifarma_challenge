import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' show ScrollController;

extension EitherX<L, R> on Either<L, R> {
  R get rightValue => fold((_) => throw Exception('No right value'), (r) => r);
  L get leftValue => fold((l) => l, (_) => throw Exception('No left value'));
}

extension ScrollControllerX on ScrollController {
  bool get isAtBottom => position.pixels == position.maxScrollExtent;
}
