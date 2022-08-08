import 'package:get_it/get_it.dart';

import '../../movies/data/datasource/remote/apis/movies_apis.dart';
import '../../movies/data/datasource/remote/interfaces/i_movies_apis.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/entities/movie.dart';
import '../../movies/domain/repository/base_movie_repository.dart';
import '../../movies/domain/usecases/get_movie_details.dart';
import '../../movies/domain/usecases/get_now_playing.dart';
import '../../movies/domain/usecases/get_popular_movies.dart';
import '../../movies/domain/usecases/get_recommendation.dart';
import '../../movies/domain/usecases/get_top_rated_movies.dart';
import '../../movies/presentation/providers/movie/movie_bloc.dart';
import '../../movies/presentation/providers/movie_details/movie_details_bloc.dart';
 final sl = GetIt.instance;
class ServicesLocator {


   void setup() {
     ///bloc
      sl.registerLazySingleton(() => MovieBloc(sl(), sl(), sl(),));
      sl.registerLazySingleton(() => MovieDetailsBloc(sl(), sl(), ));
     /// use cases
      sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
      sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
      sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
      sl.registerLazySingleton(() => GetMoviesDetails(sl()));
      sl.registerLazySingleton(() => GetRecommendation(sl()));

      ///repository
    sl.registerLazySingleton<IMovieRepository>(() => MoviesRepository(sl()));
    ///data source
     sl.registerLazySingleton<IMoviesAPIs>(() => MoviesApis());


  }
}