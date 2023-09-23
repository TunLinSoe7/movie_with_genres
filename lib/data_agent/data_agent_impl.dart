import 'package:dio/dio.dart';
import 'package:movie_with_genres/api/movie_api.dart';
import 'package:movie_with_genres/constant.dart';
import 'package:movie_with_genres/data_agent/data_agent.dart';
import 'package:movie_with_genres/vos/genre_vo.dart';
import 'package:movie_with_genres/vos/movie_vo.dart';

class MovieDataAgentImpl extends MovieDataAgent{
  late MovieAPI _api;
  MovieDataAgentImpl._(){
    _api =MovieAPI(Dio());
  }
  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();
  factory MovieDataAgentImpl()=>_singleton;
  @override
  Future<List<GenreVO>?> getMovieGenreList() =>_api
      .getGenreResponse(kApiKey)
      .asStream()
      .map((event) => event.genres).first;

  @override
  Future<List<MovieVO>?> getMovieList(int genreID) =>_api
      .getMovieResponse(kApiKey, genreID)
      .asStream()
      .map((event) => event.results).first;
}