part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetails;
  final RequistState movieDetailsState;
  final String errorMessage;

  final List<Recommendation> movieRecommendation;
  final RequistState movieRecommendationState;
  final String errorMessageRecommendation;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequistState.none,
    this.errorMessage = '',
    this.movieRecommendation= const [],
    this.movieRecommendationState = RequistState.none,
    this.errorMessageRecommendation = '',
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetails,
    RequistState? movieDetailsState,
    String? errorMessage,
    List<Recommendation>? movieRecommendation,
    RequistState? movieRecommendationState,
    String? errorMessageRecommendation,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        errorMessage: errorMessage ?? this.errorMessage,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        movieRecommendationState:
            movieRecommendationState ?? this.movieRecommendationState,
        errorMessageRecommendation:
            errorMessageRecommendation ?? this.errorMessageRecommendation,
      );

  @override
  List<Object> get props => [
        movieDetailsState,
        errorMessage,
        movieRecommendationState,
        errorMessageRecommendation
      ];
}
