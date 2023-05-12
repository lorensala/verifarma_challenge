part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.loading() = _Loading;
  const factory MovieDetailState.loaded(Movie movie) = _Loaded;
  const factory MovieDetailState.error(MovieFailure err) = _Error;
}
