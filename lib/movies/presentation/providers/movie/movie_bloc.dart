import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_handling/failure.dart';
import '../../../../core/utils/enums.dart';
import '../../../data/datasource/remote/apis/movies_apis.dart';
import '../../../data/datasource/remote/interfaces/i_movies_apis.dart';
import '../../../data/repository/movies_repository.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/repository/base_movie_repository.dart';
import '../../../domain/usecases/get_now_playing.dart';
import '../../../domain/usecases/get_popular_movies.dart';
import '../../../domain/usecases/get_top_rated_movies.dart';
import '../../../domain/usecases/interfaces/i_usecases.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingUseCase _getNowPlayingUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  MovieBloc(this._getNowPlayingUseCase, this._getPopularMoviesUseCase,
      this._getTopRatedMoviesUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(nowPlayingState: RequistState.loading));
    final result = await _getNowPlayingUseCase(const NoParams());
    emit(state.copyWith(nowPlayingState: RequistState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingMessage: l.message, nowPlayingState: RequistState.error)),
        (List<Movie> r) => emit(state.copyWith(
            nowPlayingState: RequistState.loaded, nowPlayingMovies: r)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(topRatedState: RequistState.loading));
    final result = await _getTopRatedMoviesUseCase(const NoParams());
    emit(state.copyWith(topRatedState: RequistState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            topRatedMessage: l.message, topRatedState: RequistState.error)),
        (List<Movie> r) => emit(state.copyWith(
            topRatedState: RequistState.loaded, topRatedMovies: r)));
    //close the stream


  }

  FutureOr<void> _getPopularMovies(
      GetPopularEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(popularState: RequistState.loading));
    final Either<Failure, List<Movie>> result =
        await _getPopularMoviesUseCase(const NoParams());
    emit(state.copyWith(popularState: RequistState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            popularMessage: l.message, popularState: RequistState.error)),
        (List<Movie> r) => emit(state.copyWith(
            popularState: RequistState.loaded, popularMovies: r)));
  }
}
