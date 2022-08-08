class AppApis{
  static const String baseUrl = "http://api.themoviedb.org/3";
  static const String apiKey = "5ce50fe5a060d3c77515435756151159";
  static const String popularMoviesUrl = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String nowPlayingUrl = "$baseUrl/movie/now_playing?api_key=$apiKey";
static const String topRatedUrl = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static  String moviesDetailsUrl(int movieId)=> "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recommendationUrl(int movieId)=> "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

 static String imageBaseUrl(String imageUrl) => "https://image.tmdb.org/t/p/w500$imageUrl";

}