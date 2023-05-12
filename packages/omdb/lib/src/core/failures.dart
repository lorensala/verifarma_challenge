// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template movie_failure}
/// Failure for a movie.
/// {@endtemplate}
@freezed
class MovieFailure with _$MovieFailure {
  const factory MovieFailure.unknown() = _Unknown;
  const factory MovieFailure.empty() = _Empty;
  const factory MovieFailure.noResults() = _NoResults;
  const factory MovieFailure.noConnection() = _NoConnection;
  const factory MovieFailure.badCertificate() = _BadCertificate;
  const factory MovieFailure.badResponse() = _BadResponse;
}
