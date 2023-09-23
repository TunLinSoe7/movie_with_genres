import 'package:hive/hive.dart';
import 'package:movie_with_genres/constant.dart';
import 'package:movie_with_genres/daos/genre_dao.dart';
import 'package:movie_with_genres/vos/genre_vo.dart';

class GenreDAOImpl extends GenreDAO{
  @override
  List<GenreVO>? getGenreList() =>_box().values.toList();

  @override
  Stream<List<GenreVO>?> getGenreListFromDatabase()=>Stream.value(getGenreList());

  @override
  void save(List<GenreVO> genreList) {
    for (var value in genreList) {
      _box().put(value.id, value);
    }
  }

  @override
  Stream watch() =>_box().watch();
  Box<GenreVO> _box ()=>Hive.box<GenreVO>(kBoxNameForGenre);

}