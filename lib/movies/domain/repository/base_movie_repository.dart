import 'package:dartz/dartz.dart';

import '../../../core/error_handling/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_details.dart';
import '../usecases/get_recommendation.dart';

/// this abstract class is used to store the movie data
abstract class IMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MoviesDetailsParams moviesDetailsParams);

  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameters recommendationParameters);
}
