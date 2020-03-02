import 'package:flutter_movie_db/src/data/MoviesServiceApi.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesDataSource.dart';
import 'package:flutter_movie_db/src/data/movies/remote/MoviesRemoteDataSource.dart';

import 'local/MoviesLocalDataSource.dart';

class MoviesRepository implements RemoteMoviesDataSource, LocalMoviesDataSource{
  MoviesRemoteDataSource _moviesRemoteDataSource = new MoviesRemoteDataSource(MoviesServiceApi());
  MoviesLocalDataSource _moviesLocalDataSource = new MoviesLocalDataSource();

  @override
  getLatestMovie() {
    return _moviesRemoteDataSource.getLatestMovie();
  }

  @override
  getMovieVideoById(int id) async{
    return await _moviesRemoteDataSource.getMovieVideoById(id);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    print((await _moviesRemoteDataSource.getPopularMovies()).results);

    return (await _moviesRemoteDataSource.getPopularMovies()).results;
  }

  @override
  getSimilarMoviesByMovieId(int id) async{
    var movies = await _moviesRemoteDataSource.getSimilarMoviesByMovieId(id);
//    print(movies);
    return movies;
  }

  @override
  getMovieById(int id) async{
    var movie = await _moviesLocalDataSource.getMovieVideoById(id);
    print(movie);
    return movie;
  }

  @override
  getMoviesInTheatres() async{
    var movies = await _moviesRemoteDataSource.getMoviesInTheatres();
    print(movies);
    return movies;
  }

}