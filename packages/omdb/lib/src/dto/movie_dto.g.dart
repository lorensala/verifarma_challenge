// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieDto _$$_MovieDtoFromJson(Map<String, dynamic> json) => _$_MovieDto(
      title: json['title'] as String,
      year: json['year'] as String,
      rated: json['rated'] as String,
      released: json['released'] as String,
      runtime: json['runtime'] as String,
      genre: json['genre'] as String,
      director: json['director'] as String,
      writer: json['writer'] as String,
      actors: json['actors'] as String,
      plot: json['plot'] as String,
      language: json['language'] as String,
      country: json['country'] as String,
      awards: json['awards'] as String,
      poster: json['poster'] as String,
      ratings: (json['ratings'] as List<dynamic>)
          .map((e) => RatingDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      metascore: json['metascore'] as String,
      imdbRating: json['imdbRating'] as String,
      imdbVotes: json['imdbVotes'] as String,
      imdbId: json['imdbId'] as String,
      type: json['type'] as String,
      dvd: json['dvd'] as String,
      boxOffice: json['boxOffice'] as String,
      production: json['production'] as String,
      website: json['website'] as String,
      response: json['response'] as String,
    );

Map<String, dynamic> _$$_MovieDtoToJson(_$_MovieDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
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
      'poster': instance.poster,
      'ratings': instance.ratings,
      'metascore': instance.metascore,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbId': instance.imdbId,
      'type': instance.type,
      'dvd': instance.dvd,
      'boxOffice': instance.boxOffice,
      'production': instance.production,
      'website': instance.website,
      'response': instance.response,
    };
