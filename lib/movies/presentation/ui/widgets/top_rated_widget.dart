import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie.dart';
import '../../providers/movie/movie_bloc.dart';
import '../screens/dummy.dart';
import 'list_of_movies.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (previous, current) => previous.topRatedState==RequistState.loaded,
          builder: (context, state) {

        switch (state.topRatedState) {
          case RequistState.none:
            return const SizedBox(
              height: 400,
            );

          case RequistState.loading:
            return const SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));

          case RequistState.loaded:
            return MovieList(moviesList:  state.topRatedMovies);
          case RequistState.error:
            return Center(child: Text(state.topRatedMessage));
        }
      });

}
