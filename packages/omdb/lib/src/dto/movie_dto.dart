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
    @Default('N/A') @JsonKey(name: 'Title') String? title,
    @Default('N/A') @JsonKey(name: 'Year') String? year,
    @Default('N/A') String? rated,
    @Default('N/A') String? released,
    @Default('N/A') String? runtime,
    @Default('N/A') String? genre,
    @Default('N/A') String? director,
    @Default('N/A') String? writer,
    @Default('N/A') String? actors,
    @Default('N/A') String? plot,
    @Default('N/A') String? language,
    @Default('N/A') String? country,
    @Default('N/A') String? awards,
    @Default('N/A') @JsonKey(name: 'Poster') String? poster,
    @Default([]) List<RatingDto>? ratings,
    @Default('N/A') String? metascore,
    @Default('N/A') String? imdbRating,
    @Default('N/A') String? imdbVotes,
    @Default('N/A') @JsonKey(name: 'imdbID') String? imdbId,
    @Default('N/A') @JsonKey(name: 'Type') String? type,
    @Default('N/A') String? dvd,
    @Default('N/A') String? boxOffice,
    @Default('N/A') String? production,
    @Default('N/A') String? website,
    @Default('N/A') String? response,
  }) = _MovieDto;

  /// Converts a JSON object to a [MovieDto].
  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  const MovieDto._();

  /// Converts a [MovieDto] to a [Movie].
  Movie toModel() {
    try {
      return Movie(
        title: title ?? '',
        year: year ?? '',
        rated: rated ?? '',
        released: released ?? '',
        runtime: runtime ?? '',
        genre: genre ?? '',
        director: director ?? '',
        writer: writer ?? '',
        actors: actors ?? '',
        plot: plot ?? '',
        language: language ?? '',
        country: country ?? '',
        awards: awards ?? '',
        poster: poster ?? '',
        ratings: ratings?.map((e) => e.toModel()).toList() ?? [],
        metascore: metascore ?? '',
        imdbRating: imdbRating ?? '',
        imdbVotes: imdbVotes ?? '',
        imdbId: imdbId ?? '',
        type: type ?? '',
        dvd: dvd ?? '',
        boxOffice: boxOffice ?? '',
        production: production ?? '',
        website: website ?? '',
        response: response ?? '',
      );
    } catch (e) {
      throw const MovieConvertionException();
    }
  }
}
