import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_details.dart';
import '../../providers/movie/movie_bloc.dart';
import '../screens/dummy.dart';
import '../screens/movie_detail_screen.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (MovieState previous, MovieState current) =>
          previous.nowPlayingState == RequistState.loaded,
      builder: (BuildContext context, MovieState state) {
        switch (state.nowPlayingState) {
          case RequistState.none:
            return const SizedBox(
              height: 400,
            );

          case RequistState.loading:
            return const SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));

          case RequistState.loaded:
            return _nowPlayingWidget(context, state.nowPlayingMovies);
          case RequistState.error:
            return Center(child: Text(state.nowPlayingMessage));
        }
      });

  Widget _nowPlayingWidget(BuildContext context, List<Movie> movies) =>
      FadeIn(
        duration: const Duration(milliseconds: 500),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 400.0,
            viewportFraction: 1.0,
            onPageChanged: (int index, CarouselPageChangedReason reason) {},
          ),
          items: movies
              .map(
                (Movie item) => GestureDetector(
                  //key: const Key('openMovieMinimalDetail'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MovieDetailScreen(
                                  id: item.id,
                                )));
                  },
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect rect) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // fromLTRB
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0, 0.3, 0.5, 1],
                        ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height),
                        ),
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          height: 560,
                          imageUrl: AppApis.imageBaseUrl(item.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.redAccent,
                                    size: 16.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    'Now Playing'.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );
}
