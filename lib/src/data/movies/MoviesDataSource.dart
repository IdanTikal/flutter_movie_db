import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';

abstract class MoviesDataSource{
  getMovieVideoById(int id);
}

abstract class RemoteMoviesDataSource implements MoviesDataSource{
  getLatestMovie();
  getPopularMovies();
  getMoviesInTheatres();
  getSimilarMoviesByMovieId(int id);
}

abstract class LocalMoviesDataSource implements MoviesDataSource{
  getMovieById(int id);
}