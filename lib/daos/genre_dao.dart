import '../vos/genre_vo.dart';

abstract class GenreDAO{
  void save(List<GenreVO> genreList);
  List<GenreVO>? getGenreList();
  Stream watch();
  Stream<List<GenreVO>?> getGenreListFromDatabase();
}