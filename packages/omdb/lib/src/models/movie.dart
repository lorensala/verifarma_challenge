import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omdb/src/models/models.dart';

part 'movie.freezed.dart';

/// {@template movie}
/// Model for a movie.
/// {@endtemplate}
@freezed
class Movie with _$Movie {
  /// {@macro movie}
  const factory Movie({
    required String title,
    required String year,
    required String rated,
    required String released,
    required String runtime,
    required String genre,
    required String director,
    required String writer,
    required String actors,
    required String plot,
    required String language,
    required String country,
    required String awards,
    required String poster,
    required List<Rating> ratings,
    required String metascore,
    required String imdbRating,
    required String imdbVotes,
    required String imdbId,
    required String type,
    required String dvd,
    required String boxOffice,
    required String production,
    required String website,
    required String response,
  }) = _Movie;
}
