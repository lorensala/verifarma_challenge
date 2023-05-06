import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omdb/src/core/core.dart';
import 'package:omdb/src/dto/rating_dto.dart';
import 'package:omdb/src/models/models.dart';

part 'movie_dto.freezed.dart';
part 'movie_dto.g.dart';

/// {@template movie_dto}
/// Data Transfer Object for a movie.
/// {@endtemplate}
@freezed
class MovieDto with _$MovieDto {
  /// {@macro movie_dto}
  const factory MovieDto({
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
    required List<RatingDto> ratings,
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
  }) = _MovieDto;

  /// Converts a JSON object to a [MovieDto].
  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  const MovieDto._();

  /// Converts a [MovieDto] to a [Movie].
  Movie toModel() {
    try {
      return Movie(
        title: title,
        year: year,
        rated: rated,
        released: released,
        runtime: runtime,
        genre: genre,
        director: director,
        writer: writer,
        actors: actors,
        plot: plot,
        language: language,
        country: country,
        awards: awards,
        poster: poster,
        ratings: ratings.map((e) => e.toModel()).toList(),
        metascore: metascore,
        imdbRating: imdbRating,
        imdbVotes: imdbVotes,
        imdbId: imdbId,
        type: type,
        dvd: dvd,
        boxOffice: boxOffice,
        production: production,
        website: website,
        response: response,
      );
    } catch (e) {
      throw const MovieConvertionException();
    }
  }
}
