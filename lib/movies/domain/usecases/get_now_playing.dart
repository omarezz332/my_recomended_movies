import 'package:dartz/dartz.dart';
import 'package:my_recomended_movies/movies/domain/usecases/interfaces/i_usecases.dart';

import '../../../core/error_handling/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';
import 'interfaces/i_usecases.dart';


class GetNowPlayingUseCase implements IUseCases <List<Movie>,NoParams>{
  /// this class is used to get the now playing movies
  GetNowPlayingUseCase(this._movieRepository);

  final IMovieRepository _movieRepository;

  /// this method is used to get the now playing movies
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams noParams) async =>
      _movieRepository.getNowPlaying();
}
