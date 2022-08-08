import 'package:dartz/dartz.dart';

import '../../../core/error_handling/failure.dart';
import '../entities/movie_details.dart';
import '../repository/base_movie_repository.dart';
import 'interfaces/i_usecases.dart';
class GetMoviesDetails implements IUseCases<MovieDetail, MoviesDetailsParams> {
  /// this class is used to get the movie details
  GetMoviesDetails(this._movieRepository);

  final IMovieRepository _movieRepository;

  /// this method is used to get the movie details
  @override
  Future<Either<Failure, MovieDetail>> call(
          MoviesDetailsParams moviesDetailsParams) async =>
      _movieRepository.getMovieDetails(moviesDetailsParams);
}

class MoviesDetailsParams {
  final int movieId;

  MoviesDetailsParams(this.movieId);
}
