import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../core/error_handling/exeptions.dart';
import '../../../../../core/network/error_message_model.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../domain/entities/movie_details.dart';
import '../../../../domain/entities/recommendation.dart';
import '../../../../domain/usecases/get_movie_details.dart';
import '../../../../domain/usecases/get_recommendation.dart';
import '../../../models/details_movie_model.dart';
import '../../../models/movie_model.dart';
import '../../../models/recommendation_model.dart';
import '../interfaces/i_movies_apis.dart';

class MoviesApis implements IMoviesAPIs {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final Response response = await Dio().get(AppApis.nowPlayingUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'])
          .map((movie) => MovieModel.fromJson(movie))
          .toList());
    } else {
      throw ServerException(
          errorMessage: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final Response response = await Dio().get(AppApis.popularMoviesUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"])
          .map((movie) => MovieModel.fromJson(movie))
          .toList());
    } else {
      throw ServerException(
          errorMessage: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final Response response = await Dio().get(AppApis.topRatedUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'])
          .map((movie) => MovieModel.fromJson(movie))
          .toList());
    } else {
      throw ServerException(
          errorMessage: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesDetailsModel> getMovieDetails(
      MoviesDetailsParams moviesDetailsParams) async {
    final Response response =
        await Dio().get(AppApis.moviesDetailsUrl(moviesDetailsParams.movieId));
    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessage: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getMovieRecommendation(RecommendationParameters recommendationParameters) async{
    final Response response =
        await Dio().get(AppApis.recommendationUrl(recommendationParameters.movieId));
    if (response.statusCode == 200) {
      return List<Recommendation>.from((response.data['results'])
          .map((movie) => RecommendationModel.fromJson(movie))
          .toList());
    } else {
      throw ServerException(
          errorMessage: ErrorMessageModel.fromJson(response.data));
    }
  }
}
