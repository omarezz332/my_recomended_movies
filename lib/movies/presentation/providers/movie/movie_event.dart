part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}
class GetNowPlayingEvent extends MovieEvent {
  @override
  List<Object> get props => [];
}
class GetPopularEvent extends MovieEvent {
  @override
  List<Object> get props => [];
}
class GetTopRatedEvent extends MovieEvent {
  @override
  List<Object> get props => [];
}
