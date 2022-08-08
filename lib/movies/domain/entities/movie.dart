import 'package:equatable/equatable.dart';

/// this class is used to store the movie data
class Movie extends Equatable{
final int id;
final String title;
final String overview;
final String releaseDate;
final double voteAverage;
final double popularity;
final int voteCount;
final  String backdropPath;
final String posterPath;
final List<int> genreIds;


 const Movie({
    required this.id,
   required this.title,
   required this.overview,
   required this.releaseDate,
   required this.voteAverage,
   required this.popularity,
   required this.voteCount,
    required this.backdropPath,
    required this.posterPath,
    required this.genreIds,

  });


  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        releaseDate,
        voteAverage,
        popularity,
        voteCount,
        backdropPath,
        posterPath,
        genreIds,
      ];
}