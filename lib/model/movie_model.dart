import 'package:movie_with_genres/vos/genre_vo.dart';

import '../vos/movie_vo.dart';

abstract class MovieModel{
  Future<List<GenreVO>?> getGenreList();
  Stream<List<GenreVO>?> getGenreListFromDataBase();
  Future<List<MovieVO>?> getMovieList(int genreID);
  Stream<List<MovieVO>?> getMovieListFromDataBase(int genreID);
}