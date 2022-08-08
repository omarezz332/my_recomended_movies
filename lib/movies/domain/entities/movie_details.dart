import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final int runtime;
  final String overview;
  final String title;
  final double voteAverage;
  final String releaseDate;

  const MovieDetail(
      {required this.backdropPath,
      required this.id,
      required this.runtime,
      required this.overview,
      required this.title,
      required this.voteAverage,
      required this.genres,
      required this.releaseDate});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        runtime,
        overview,
        title,
        voteAverage,
        releaseDate,
        genres
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({required this.id, required this.name});

  @override
  @override
  List<Object> get props {
    return [id, name];
  }
}
