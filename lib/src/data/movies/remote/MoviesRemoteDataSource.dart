import 'package:dio/dio.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesDataSource.dart';
import 'package:flutter_movie_db/src/data/MoviesServiceApi.dart';

import '../MovieModel.dart';

class MoviesRemoteDataSource implements RemoteMoviesDataSource{
  MoviesServiceApi _serviceApi;

  MoviesRemoteDataSource(MoviesServiceApi serviceApi){
    _serviceApi = serviceApi;
  }

  @override
  getLatestMovie() {
    return _serviceApi.getLatestMovie();
  }

  @override
  getMovieReviewsByMovieId(int id) {
    return _serviceApi.getMovieReviewsByMovieId(id);
  }

  @override
  getMovieVideoById(id) {
    return _serviceApi.getMovieVideoById(id);
  }

  @override
  getMoviesInTheatres() {
    return _serviceApi.getMoviesInTheatres();
  }

  @override
  Future<MovieResponse> getPopularMovies() async {
    Response response = await _serviceApi.getPopularMovies();
    return new MovieResponse.fromJson(response.data);
  }

  @override
  getSimilarMoviesByMovieId(int id) {
    return _serviceApi.getSimilarMoviesByMovieId(id);
  }
}