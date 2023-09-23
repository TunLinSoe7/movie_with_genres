import 'package:movie_with_genres/vos/genre_vo.dart';
import 'package:movie_with_genres/vos/movie_vo.dart';

abstract class MovieDataAgent{
  Future<List<GenreVO>?> getMovieGenreList();
  Future<List<MovieVO>?> getMovieList(int genreID);
}