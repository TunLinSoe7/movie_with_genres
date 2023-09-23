import 'package:dio/dio.dart';
import 'package:movie_with_genres/constant.dart';
import 'package:movie_with_genres/response/movie_response.dart';
import 'package:retrofit/retrofit.dart';
import '../response/genre_response.dart';
part 'movie_api.g.dart';
@RestApi(baseUrl: kMovieBaseURL)
abstract class MovieAPI{
  factory MovieAPI(Dio dio)=>_MovieAPI(dio);
  @GET(kGetGenresEndPoint)
  Future<GenresResponse> getGenreResponse(
      @Query(kQueryApiKey) String apiKey,
      );
  @GET(kGetMovieByGenres)
  Future<MovieResponse> getMovieResponse(
      @Query(kQueryApiKey) String apiKey,
      @Query(kQueryGenres) int genreID,
      );
}