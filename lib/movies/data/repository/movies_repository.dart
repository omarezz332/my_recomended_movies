import 'dart:developer';

import '../../../core/error_handling/exeptions.dart';
import '../../../core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_recommendation.dart';
import '../datasource/remote/interfaces/i_movies_apis.dart';
import '../models/movie_model.dart';

class MoviesRepository implements IMovieRepository {
  final IMoviesAPIs _moviesAPIs;

  MoviesRepository(this._moviesAPIs);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final List<MovieModel> result = await _moviesAPIs.getNowPlayingMovies();
    try {
      return Right(result); // Right(result) is a Right<Failure,List<Movie>>
    } on ServerException catch (e) {
      return Left(ServerFailure(
          e.errorMessage.message)); // Left(e) is a Left<Failure,List<Movie>>
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final List<MovieModel> result = await _moviesAPIs.getPopularMovies();
    try {
      return Right(result); // Right(result) is a Right<Failure,List<Movie>>
    } on ServerException catch (e) {
      return Left(ServerFailure(
          e.errorMessage.message)); // Left(e) is a Left<Failure,List<Movie>>
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final List<MovieModel> result = await _moviesAPIs.getTopRatedMovies();
    try {
      return Right(result); // Right(result) is a Right<Failure,List<Movie>>
    } on ServerException catch (e) {
      return Left(ServerFailure(
          e.errorMessage.message)); // Left(e) is a Left<Failure,List<Movie>>
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MoviesDetailsParams moviesDetailsParams) async {
    final MovieDetail result =
        await _moviesAPIs.getMovieDetails(moviesDetailsParams);
    try {
      return Right(result); // Right(result) is a Right<Failure,List<Movie>>
    } on ServerException catch (e) {
      return Left(ServerFailure(
          e.errorMessage.message)); // Left(e) is a Left<Failure,List<Movie>>
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameters recommendationParameters) async{
    final List<Recommendation> result =
        await _moviesAPIs.getMovieRecommendation(recommendationParameters);
    try {
      return Right(result); // Right(result) is a Right<Failure,List<Movie>>
    } on ServerException catch (e) {
      return Left(ServerFailure(
          e.errorMessage.message)); // Left(e) is a Left<Failure,List<Movie>>
    }
  }
}
