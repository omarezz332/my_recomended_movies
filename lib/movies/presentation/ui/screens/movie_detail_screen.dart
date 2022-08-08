import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/servecis/service_locator.dart';
import '../../providers/movie/movie_bloc.dart';
import '../../providers/movie_details/movie_details_bloc.dart';
import '../widgets/movie_details.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
    //lazy: false,
        create: (BuildContext context) => sl<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(id))
          ..add(GetMovieRecommendationEvent(id),


          ),
        child: const Scaffold(
          body: MovieDetailContent(
              // movie: movieDetailDummy,
              //recommendations: recommendationDummy,
              ),
        ),
      );
}
