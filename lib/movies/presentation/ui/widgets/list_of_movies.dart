import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../domain/entities/movie.dart';
import '../screens/movie_detail_screen.dart';
class MovieList extends StatelessWidget {

  const MovieList({required this.moviesList , Key? key }) : super(key: key);
final List<Movie> moviesList;
  @override
  Widget build(BuildContext context) => FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: moviesList.length,
          itemBuilder: (BuildContext context, int index) {
            final Movie movie = moviesList[index];
            return Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MovieDetailScreen(
                            id: movie.id,
                          )));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: CachedNetworkImage(
                    width: 120.0,
                    fit: BoxFit.cover,
                    imageUrl: AppApis.imageBaseUrl(movie.backdropPath),
                    placeholder: (BuildContext context, String url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (BuildContext context, String url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Movie>('moviesList', moviesList));
  }
}
