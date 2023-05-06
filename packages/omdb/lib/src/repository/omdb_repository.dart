import 'package:dartz/dartz.dart';
import 'package:omdb/src/api/api.dart';
import 'package:omdb/src/core/core.dart';
import 'package:omdb/src/models/models.dart';

/// {@template omdb_repository}
/// Repository for the Open Movie Database.
/// {@endtemplate}
class OmdbRepository {
  /// {@macro omdb_repository}
  OmdbRepository({required OmdbApi api}) : _api = api;

  final OmdbApi _api;

  /// Fetches a list of movies.
  Future<Either<MovieFailure, List<Movie>>> fetchMovies([
    String query = 'argentina',
  ]) async {
    try {
      final movies = await _api.fetchMovies(query);

      return Right(movies.map((e) => e.toModel()).toList());
    } on MovieNoConnectionException {
      return const Left(MovieFailure.noConnection());
    } on MovieBadCertificateException {
      return const Left(MovieFailure.badCertificate());
    } on MovieBadResponseException {
      return const Left(MovieFailure.badResponse());
    } catch (_) {
      return const Left(MovieFailure.unknown());
    }
  }

  /// Fetches a movie by its [id].
  Future<Either<MovieFailure, Movie>> fetchMovie(String id) async {
    try {
      final movie = await _api.fetchMovie(id);

      return Right(movie.toModel());
    } on MovieNoConnectionException {
      return const Left(MovieFailure.noConnection());
    } on MovieBadCertificateException {
      return const Left(MovieFailure.badCertificate());
    } on MovieBadResponseException {
      return const Left(MovieFailure.badResponse());
    } catch (_) {
      return const Left(MovieFailure.unknown());
    }
  }
}
