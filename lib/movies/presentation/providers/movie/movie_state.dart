part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = "",
    this.nowPlayingState = RequistState.none,
    this.topRatedMovies = const [],
    this.topRatedState = RequistState.none,
    this.topRatedMessage = "",
    this.popularMovies = const [],
    this.popularState = RequistState.none,
    this.popularMessage = "",
  });
  ///now playing movie state
  final List<Movie> nowPlayingMovies;
  final RequistState nowPlayingState;
  final String nowPlayingMessage;
  ///top rated movie state
  final List<Movie> topRatedMovies;
  final RequistState topRatedState;
  final String topRatedMessage;
  /// popular movie state
  final List<Movie> popularMovies;
  final RequistState popularState;
  final String popularMessage;
  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequistState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? topRatedMovies,
    RequistState? topRatedState,
    String? topRatedMessage,
    List<Movie>? popularMovies,
    RequistState? popularState,
    String? popularMessage,
  }) => MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
    );

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
        popularMovies,
        popularState,
        popularMessage
      ];
}

class GetPopularMovieState extends Equatable {
  const GetPopularMovieState(
      this.topRatedMovies,
      this.topRatedState,
      this.topRatedMessage,
      this.popularMovies,
      this.popularState,
      this.popularMessage,
      {this.nowPlayingMovies = const [],
      this.nowPlayingMessage = "",
      this.nowPlayingState = RequistState.none});

  ///now playing movie state
  final List<Movie> nowPlayingMovies;
  final RequistState nowPlayingState;
  final String nowPlayingMessage;

  ///top rated movie state
  final List<Movie> topRatedMovies;
  final RequistState topRatedState;
  final String topRatedMessage;

  /// popular movie state
  final List<Movie> popularMovies;
  final RequistState popularState;
  final String popularMessage;

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
        popularMovies,
        popularState,
        popularMessage
      ];
}
