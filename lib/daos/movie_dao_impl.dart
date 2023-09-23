import 'package:hive/hive.dart';
import 'package:movie_with_genres/constant.dart';
import 'package:movie_with_genres/daos/movie_dao.dart';
import 'package:movie_with_genres/vos/movie_vo.dart';

class MovieDAOImpl extends MovieDAO{
  @override
  List<MovieVO>? getMovieList(int genreID) =>_box().values.toList();

  @override
  Stream<List<MovieVO>?> getMovieListFromStream(int genreID) =>Stream.value(getMovieList(genreID));

  @override
  void save(List<MovieVO> movieList) {
   for (var value in movieList) {
     _box().put(value.id, value);
   }
  }

  @override
  Stream watch() =>_box().watch();
  Box<MovieVO> _box()=>Hive.box<MovieVO>(kBoxNameForMovie);
}