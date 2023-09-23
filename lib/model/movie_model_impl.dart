import 'package:movie_with_genres/daos/genre_dao.dart';
import 'package:movie_with_genres/daos/genre_dao_impl.dart';
import 'package:movie_with_genres/daos/movie_dao.dart';
import 'package:movie_with_genres/daos/movie_dao_impl.dart';
import 'package:movie_with_genres/data_agent/data_agent.dart';
import 'package:movie_with_genres/data_agent/data_agent_impl.dart';
import 'package:movie_with_genres/model/movie_model.dart';
import 'package:movie_with_genres/vos/genre_vo.dart';
import 'package:movie_with_genres/vos/movie_vo.dart';
import 'package:stream_transform/stream_transform.dart';
class MovieModelImpl extends MovieModel{
  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();
  final GenreDAO _dao = GenreDAOImpl();
  final MovieDAO _movieDAO = MovieDAOImpl();
  @override
  Future<List<GenreVO>?> getGenreList()=>_movieDataAgent
      .getMovieGenreList()
      .then((value) {
        if(value!=null){
          _dao.save(value);
          getMovieList(value.first.id ?? 1);
        }
  });
  @override
  Stream<List<GenreVO>?> getGenreListFromDataBase() =>_dao
      .watch()
      .startWith(_dao.getGenreListFromDatabase())
      .map((event) => _dao.getGenreList());

  @override
  Future<List<MovieVO>?> getMovieList(int genreID) =>_movieDataAgent
      .getMovieList(genreID)
      .then((value) {
        if(value!=null){
          _movieDAO.save(value);
        }
  });

  @override
  Stream<List<MovieVO>?> getMovieListFromDataBase(int genreID) =>_movieDAO
      .watch()
      .startWith(_movieDAO.getMovieListFromStream(genreID))
      .map((event) => _movieDAO.getMovieList(genreID));
 }