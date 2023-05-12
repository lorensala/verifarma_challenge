// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieDto _$$_MovieDtoFromJson(Map<String, dynamic> json) => _$_MovieDto(
      title: json['Title'] as String? ?? 'N/A',
      year: json['Year'] as String? ?? 'N/A',
      rated: json['Rated'] as String? ?? 'N/A',
      released: json['Released'] as String? ?? 'N/A',
      runtime: json['Runtime'] as String? ?? 'N/A',
      genre: json['Genre'] as String? ?? 'N/A',
      director: json['Director'] as String? ?? 'N/A',
      writer: json['Writer'] as String? ?? 'N/A',
      actors: json['Actors'] as String? ?? 'N/A',
      plot: json['Plot'] as String? ?? 'N/A',
      language: json['Language'] as String? ?? 'N/A',
      country: json['Country'] as String? ?? 'N/A',
      awards: json['Awards'] as String? ?? 'N/A',
      poster: json['Poster'] as String? ?? 'N/A',
      ratings: (json['Ratings'] as List<dynamic>?)
              ?.map((e) => RatingDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metascore: json['Metascore'] as String? ?? 'N/A',
      imdbRating: json['imdbRating'] as String? ?? '0',
      imdbVotes: json['imdbVotes'] as String? ?? '0',
      imdbID: json['imdbID'] as String,
      type: json['Type'] as String? ?? 'N/A',
      dvd: json['Dvd'] as String? ?? 'N/A',
      boxOffice: json['BoxOffice'] as String? ?? 'N/A',
      production: json['Production'] as String? ?? 'N/A',
      website: json['Webstire'] as String? ?? 'N/A',
      response: json['Response'] as String? ?? 'N/A',
    );

Map<String, dynamic> _$$_MovieDtoToJson(_$_MovieDto instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Awards': instance.awards,
      'Poster': instance.poster,
      'Ratings': instance.ratings,
      'Metascore': instance.metascore,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbID': instance.imdbID,
      'Type': instance.type,
      'Dvd': instance.dvd,
      'BoxOffice': instance.boxOffice,
      'Production': instance.production,
      'Webstire': instance.website,
      'Response': instance.response,
    };
