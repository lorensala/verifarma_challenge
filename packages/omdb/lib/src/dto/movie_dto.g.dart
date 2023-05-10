// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieDto _$$_MovieDtoFromJson(Map<String, dynamic> json) => _$_MovieDto(
      title: json['Title'] as String? ?? 'N/A',
      year: json['Year'] as String? ?? 'N/A',
      rated: json['rated'] as String? ?? 'N/A',
      released: json['released'] as String? ?? 'N/A',
      runtime: json['runtime'] as String? ?? 'N/A',
      genre: json['genre'] as String? ?? 'N/A',
      director: json['director'] as String? ?? 'N/A',
      writer: json['writer'] as String? ?? 'N/A',
      actors: json['actors'] as String? ?? 'N/A',
      plot: json['plot'] as String? ?? 'N/A',
      language: json['language'] as String? ?? 'N/A',
      country: json['country'] as String? ?? 'N/A',
      awards: json['awards'] as String? ?? 'N/A',
      poster: json['Poster'] as String? ?? 'N/A',
      ratings: (json['ratings'] as List<dynamic>?)
              ?.map((e) => RatingDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metascore: json['metascore'] as String? ?? 'N/A',
      imdbRating: json['imdbRating'] as String? ?? 'N/A',
      imdbVotes: json['imdbVotes'] as String? ?? 'N/A',
      imdbId: json['imdbID'] as String? ?? 'N/A',
      type: json['Type'] as String? ?? 'N/A',
      dvd: json['dvd'] as String? ?? 'N/A',
      boxOffice: json['boxOffice'] as String? ?? 'N/A',
      production: json['production'] as String? ?? 'N/A',
      website: json['website'] as String? ?? 'N/A',
      response: json['response'] as String? ?? 'N/A',
    );

Map<String, dynamic> _$$_MovieDtoToJson(_$_MovieDto instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'rated': instance.rated,
      'released': instance.released,
      'runtime': instance.runtime,
      'genre': instance.genre,
      'director': instance.director,
      'writer': instance.writer,
      'actors': instance.actors,
      'plot': instance.plot,
      'language': instance.language,
      'country': instance.country,
      'awards': instance.awards,
      'Poster': instance.poster,
      'ratings': instance.ratings,
      'metascore': instance.metascore,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbID': instance.imdbId,
      'Type': instance.type,
      'dvd': instance.dvd,
      'boxOffice': instance.boxOffice,
      'production': instance.production,
      'website': instance.website,
      'response': instance.response,
    };
