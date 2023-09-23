
import 'package:flutter/foundation.dart';
import '../model/movie_model.dart';
import '../model/movie_model_impl.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

class HomePageProvider extends ChangeNotifier{
  final MovieModel _movieModel = MovieModelImpl();
   int? genreID;
  List<GenreVO>? getGenreList;
  List<MovieVO>? getMovieList;
  HomePageProvider(){
    _movieModel.getGenreList();
    _movieModel.getGenreListFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        getGenreList = event;
        final firstData = getGenreList?.first;
        firstData?.isSelected = true;
        getGenreList?.removeAt(0);
        getGenreList?.insert(0, firstData!);
      } else {
        getGenreList = [];
      }
      getGenreList = event;
      notifyListeners();
    });

    _movieModel.getMovieListFromDataBase(genreID ?? 0).listen((event) {
      print("genres====>${event?.length}");
      getMovieList = event;
      notifyListeners();
    });
  }
  selectedGenre(GenreVO selectedGenre) {
    getGenreList = getGenreList?.map((e) {
      e.isSelected = (e.id ==selectedGenre.id);
      return e;
    } ).toList();

    _movieModel.getMovieList(selectedGenre.id ?? 0);
    notifyListeners();
  }


}