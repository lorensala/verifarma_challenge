// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omdb/src/core/core.dart';
import 'package:omdb/src/models/models.dart';

part 'rating_dto.freezed.dart';
part 'rating_dto.g.dart';

/// {@template rating_dto}
/// Data Transfer Object for a rating.
/// {@endtemplate}
@freezed
class RatingDto with _$RatingDto {
  /// {@macro rating_dto}
  const factory RatingDto({
    @Default('N/A') @JsonKey(name: 'Source') String source,
    @Default('0') @JsonKey(name: 'Value') String value,
  }) = _RatingDto;

  /// Converts a JSON object to a [RatingDto].
  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);

  const RatingDto._();

  /// Converts a [RatingDto] to a [Rating].
  Rating toModel() {
    try {
      return Rating(
        source: source,
        value: value,
      );
    } catch (_) {
      throw const MovieConvertionException();
    }
  }
}
