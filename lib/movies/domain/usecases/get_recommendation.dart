import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error_handling/failure.dart';
import '../../data/repository/movies_repository.dart';
import '../entities/recommendation.dart';
import '../repository/base_movie_repository.dart';
import 'interfaces/i_usecases.dart';

class GetRecommendation
    extends IUseCases<List<Recommendation>, RecommendationParameters> {
  final IMovieRepository _movieRepository;

  GetRecommendation(this._movieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
          RecommendationParameters params) async =>
      await _movieRepository.getMovieRecommendation(params);
}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
