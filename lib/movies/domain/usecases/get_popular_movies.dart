import 'package:dartz/dartz.dart';

import '../../../core/error_handling/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';
import 'interfaces/i_usecases.dart';

/// this class is used to get the popular movies
class GetPopularMoviesUseCase implements IUseCases<List<Movie>,NoParams> {
  /// this class is used to get the now playing movies
  GetPopularMoviesUseCase(this._movieRepository);

  final IMovieRepository _movieRepository;

  /// this method is used to get the popular movies
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams noParams ) async =>
      _movieRepository.getPopularMovies();
}
