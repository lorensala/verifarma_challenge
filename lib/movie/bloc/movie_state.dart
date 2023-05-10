part of 'movie_bloc.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.loading() = _Loading;
  const factory MovieState.loaded(List<Movie> movies) = _Loaded;
  const factory MovieState.error(MovieFailure err) = _Error;
}
