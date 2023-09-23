import '../vos/movie_vo.dart';

abstract class MovieDAO{
  void save(List<MovieVO> movieList);
  List<MovieVO>? getMovieList(int genreID);
  Stream watch();
  Stream<List<MovieVO>?> getMovieListFromStream(int genreID);
}