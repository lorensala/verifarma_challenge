part of 'movie_bloc.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.fetchMovies() = _FetchMovies;
  const factory MovieEvent.fetchMoreMovies() = _FetchMoreMovies;
}
