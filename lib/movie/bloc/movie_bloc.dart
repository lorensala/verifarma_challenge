import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omdb/omdb.dart';
// ignore: depend_on_referenced_packages
import 'package:stream_transform/stream_transform.dart';

part 'movie_bloc.freezed.dart';
part 'movie_event.dart';
part 'movie_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required OmdbRepository omdbRepository})
      : _repository = omdbRepository,
        super(const MovieState.loading()) {
    on<_FetchMovies>(_onFetchMovies);
    on<_FetchMoreMovies>(_onFetchMoreMovies);
  }

  List<Movie> _movies = [];
  int _page = 1;

  FutureOr<void> _onFetchMoreMovies(
    _FetchMoreMovies event,
    Emitter<MovieState> emit,
  ) async {
    // emit(const MovieState.loading());

    final either = await _repository.fetchMovies(page: _page + 1);

    return either.fold(
      (err) => emit(MovieState.error(err)),
      (movies) {
        _movies = List.from(_movies)..addAll(movies);
        _page++;
        emit(MovieState.loaded(_movies));
      },
    );
  }

  FutureOr<void> _onFetchMovies(
    _FetchMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(const MovieState.loading());

    final either = await _repository.fetchMovies();

    return either.fold(
      (err) => emit(MovieState.error(err)),
      (movies) {
        _movies = movies;
        emit(MovieState.loaded(_movies));
      },
    );
  }

  final OmdbRepository _repository;
}
