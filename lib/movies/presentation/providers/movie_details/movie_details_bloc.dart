import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_handling/failure.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendation.dart';
import '../../../domain/usecases/get_movie_details.dart';
import '../../../domain/usecases/get_recommendation.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetails, this.getMoviesRecommendation)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMoviesDetails getMovieDetails;
  final GetRecommendation getMoviesRecommendation;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async {
   // emit(state.copyWith(movieDetailsState: RequistState.loading));
    final Either<Failure, MovieDetail> result =
    await getMovieDetails(MoviesDetailsParams(event.movieId));
    log('result: $result');
    result.fold(
          (l) =>
          emit(state.copyWith(
            errorMessage: l.toString(),
            movieDetailsState: RequistState.error,
          )),
          (r) =>
          emit(
            state.copyWith(
              movieDetails: r,
              movieDetailsState: RequistState.loaded,
            ),
          ),
    );
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async{
   // emit(state.copyWith(movieRecommendationState: RequistState.loading));
    final Either<Failure, List<Recommendation>> result =
        await getMoviesRecommendation(RecommendationParameters(event.movieId));
    result.fold(
          (l) =>
          emit(state.copyWith(
            errorMessage: l.toString(),
            movieRecommendationState: RequistState.error,
          )),
          (r) =>
          emit(
            state.copyWith(
              movieRecommendation: r,
              movieRecommendationState: RequistState.loaded,
            ),
          ),
    );

  }
}
