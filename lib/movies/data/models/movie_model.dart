import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required int id,
      required String title,
      required String overview,
      required String releaseDate,
      required double voteAverage,
      required double popularity,
      required int voteCount,
      required String backdropPath,
required String posterPath,
required List<int> genreIds})

      : super(
            id: id,
            title: title,
            overview: overview,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            popularity: popularity,
            voteCount: voteCount,
  backdropPath: backdropPath,
  genreIds: genreIds,
  posterPath: posterPath);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"].toDouble(),
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],

    posterPath: json["poster_path"],
    genreIds: (json["genre_ids"] as List).map((e) => e as int).toList(),
    backdropPath: json["backdrop_path"],
      );
}
