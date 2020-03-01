import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesRepository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final MoviesRepository _moviesRepo = MoviesRepository();
  BehaviorSubject<List<MovieModel>> _listSubject = new BehaviorSubject();
  Stream<List<MovieModel>> get listObservable => _listSubject.stream;

  MoviesBloc(){
    loadMore();

    listObservable.listen((list){
      print("XXX");
    });
//    _listSubject.listen(())
  }

  dispose(){
    _listSubject.close();
  }

  loadMore({page: 1}) async {
    print("loadMore");
    List<MovieModel> list = await _moviesRepo.getPopularMovies();
    _listSubject.sink.add(list);
//    if (page == 1) {
//      _listSubject = new BehaviorSubject<List<MovieModel>>.seeded(list);
//    } else {
//    }
  }
}