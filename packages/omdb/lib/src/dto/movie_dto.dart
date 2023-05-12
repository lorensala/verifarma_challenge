// ignore_for_file: invalid_annotation_target

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
    @Default('N/A') @JsonKey(name: 'Title') String title,
    @Default('N/A') @JsonKey(name: 'Year') String year,
    @Default('N/A') @JsonKey(name: 'Rated') String rated,
    @Default('N/A') @JsonKey(name: 'Released') String released,
    @Default('N/A') @JsonKey(name: 'Runtime') String runtime,
    @Default('N/A') @JsonKey(name: 'Genre') String genre,
    @Default('N/A') @JsonKey(name: 'Director') String director,
    @Default('N/A') @JsonKey(name: 'Writer') String writer,
    @Default('N/A') @JsonKey(name: 'Actors') String actors,
    @Default('N/A') @JsonKey(name: 'Plot') String plot,
    @Default('N/A') @JsonKey(name: 'Language') String language,
    @Default('N/A') @JsonKey(name: 'Country') String country,
    @Default('N/A') @JsonKey(name: 'Awards') String awards,
    @Default('N/A') @JsonKey(name: 'Poster') String poster,
    @Default([]) @JsonKey(name: 'Ratings') List<RatingDto> ratings,
    @Default('N/A') @JsonKey(name: 'Metascore') String metascore,
    @Default('0') String imdbRating,
    @Default('0') String imdbVotes,
    required String imdbID,
    @Default('N/A') @JsonKey(name: 'Type') String type,
    @Default('N/A') @JsonKey(name: 'Dvd') String dvd,
    @Default('N/A') @JsonKey(name: 'BoxOffice') String boxOffice,
    @Default('N/A') @JsonKey(name: 'Production') String production,
    @Default('N/A') @JsonKey(name: 'Webstire') String website,
    @Default('N/A') @JsonKey(name: 'Response') String response,
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
        actors: actors.split(', ').toList(),
        plot: plot,
        language: language,
        country: country,
        awards: awards,
        poster: poster,
        ratings: ratings.map((e) => e.toModel()).toList(),
        metascore: metascore,
        imdbRating: imdbRating,
        imdbVotes: imdbVotes,
        imdbId: imdbID,
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
