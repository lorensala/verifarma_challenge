// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:omdb/src/core/core.dart';
import 'package:omdb/src/dto/movie_dto.dart';

/// {@template omdb_api}
/// API for the Open Movie Database.
/// {@endtemplate}
class OmdbApi {
  /// {@macro omdb_api}
  OmdbApi({required Dio dio}) : _dio = dio;

  /// Http Client.
  final Dio _dio;

  /// Fetches a list of movies.
  /// Uses [query] to filter the results.
  Future<List<MovieDto>> fetchMovies({
    String query = 'argentina',
    int page = 1,
    String type = 'movie',
  }) async {
    try {
      final res = await _dio.get<dynamic>(
        Constants.baseUrl,
        queryParameters: {
          's': query,
          'page': page,
          'r': type,
        },
      );

      final movies = res.data['Search'] as List<dynamic>;

      return movies
          .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectionError:
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw const MovieNoConnectionException();
        case DioErrorType.badCertificate:
          throw const MovieBadCertificateException();
        case DioErrorType.badResponse:
          throw const MovieBadResponseException();
        case DioErrorType.cancel:
        case DioErrorType.unknown:
          throw const MovieUnknownException();
      }
    }
  }

  /// Fetches a movie by its [id].
  Future<MovieDto> fetchMovie(String id) async {
    try {
      final res = await _dio.get<dynamic>(
        Constants.baseUrl,
        queryParameters: {
          'i': id,
        },
      );

      return MovieDto.fromJson(res.data as Map<String, dynamic>);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectionError:
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw const MovieNoConnectionException();
        case DioErrorType.badCertificate:
          throw const MovieBadCertificateException();
        case DioErrorType.badResponse:
          throw const MovieBadResponseException();
        case DioErrorType.cancel:
        case DioErrorType.unknown:
          throw const MovieUnknownException();
      }
    }
  }
}
