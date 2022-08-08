import 'dart:ffi';

import '../../domain/entities/movie_details.dart';
class MoviesDetailsModel extends MovieDetail {
  MoviesDetailsModel(
      {required String backdropPath,
      required int id,
      required int runtime,
      required String overview,
      required String title,
      required double voteAverage,
      required List<Genres> genres,
      required String releaseDate})
      : super(
            backdropPath: backdropPath,
            id: id,
            runtime: runtime,
            overview: overview,
            title: title,
            voteAverage: voteAverage,
            genres: genres,
            releaseDate: releaseDate);

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
          backdropPath: json['backdrop_path'],
          id: json['id'],
          runtime: json['runtime'],
          overview: json['overview'],
          title: json['title'],
          voteAverage: json['vote_average'],
          genres: (json['genres'] as List)
              .map((i) => GenresModel.fromJson(i))
              .toList(),
          releaseDate: json['release_date']);
}

class GenresModel extends Genres {
  GenresModel({required int id, required String name})
      : super(id: id, name: name);

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(id: json['id'], name: json['name']);
  }
}
