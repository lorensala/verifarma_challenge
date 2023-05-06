import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';

/// {@template rating}
/// Model for rating.
/// {@endtemplate}
@freezed
class Rating with _$Rating {
  /// {@macro rating}
  const factory Rating({
    required String source,
    required String value,
  }) = _Rating;
}
