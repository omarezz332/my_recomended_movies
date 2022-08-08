import '../../../../domain/entities/movie_details.dart';
import '../../../../domain/entities/recommendation.dart';
import '../../../../domain/usecases/get_movie_details.dart';
import '../../../../domain/usecases/get_recommendation.dart';
import '../../../models/movie_model.dart';

abstract class IMoviesAPIs {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetail> getMovieDetails(MoviesDetailsParams movieId);
  Future<List<Recommendation>> getMovieRecommendation(
      RecommendationParameters recommendationParameters);
}