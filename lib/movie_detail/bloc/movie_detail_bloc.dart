import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omdb/omdb.dart';

part 'movie_detail_bloc.freezed.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc({required OmdbRepository omdbRepository})
      : _repository = omdbRepository,
        super(const MovieDetailState.loading()) {
    on<_FetchMovieDetails>(_onFetchMovieDetail);
  }

  final OmdbRepository _repository;

  FutureOr<void> _onFetchMovieDetail(
    _FetchMovieDetails event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(const MovieDetailState.loading());

    final either = await _repository.fetchMovie(event.movieId);

    return either.fold(
      (err) => emit(MovieDetailState.error(err)),
      (movie) => emit(MovieDetailState.loaded(movie)),
    );
  }
}
