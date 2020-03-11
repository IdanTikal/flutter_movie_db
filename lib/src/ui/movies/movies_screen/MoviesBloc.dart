import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesRepository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final MoviesRepository _moviesRepo = MoviesRepository();
  final BehaviorSubject<List<MovieModel>> _listSubject = new BehaviorSubject();
  Stream<List<MovieModel>> get listObservable => _listSubject.stream;

  final BehaviorSubject<int> _listItemCount = new BehaviorSubject.seeded(1);
  Stream<int> get listItemCountObservable => _listItemCount.stream;

  MoviesBloc(){
    loadMoreMovies();
//    changeListItemCount();
  }

  changeListItemCount() async {
    print("changeListItemCount");
    int count = await _listItemCount.first;
    count++;
    print("ITEM COUNT: $count");
    if (count > 6){
      count = 1;
    }
    _listItemCount.sink.add(count);
  }

  dispose(){
    _listSubject.close();
  }

  loadMoreMovies({page: 1}) async {
    print("loadMore");
    List<MovieModel> list = await _moviesRepo.getPopularMovies();
    _listSubject.sink.add(list);
//    if (page == 1) {
//      _listSubject = new BehaviorSubject<List<MovieModel>>.seeded(list);
//    } else {
//    }
  }

  changeList() {}
}