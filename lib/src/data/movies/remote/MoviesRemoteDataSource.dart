import 'package:dio/dio.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesDataSource.dart';
import 'package:flutter_movie_db/src/data/MoviesServiceApi.dart';

import '../../MoviesUriPaths.dart';
import '../MovieModel.dart';

class MoviesRemoteDataSource implements RemoteMoviesDataSource{
  final MoviesServiceApi _serviceApi = MoviesServiceApi();
  get _dio => _serviceApi.dio;

//  }
//
//  getMoviesInTheatres() {
//    return _dio.get(NOW_PLAYING_PATH,
//        options: _serviceApi.cacheOptions());
//  }
//
//
//  getSimilarMoviesByMovieId(int id) {
//    return _dio.get("$SIMILAR_PATH/$id",
//        options: _serviceApi.cacheOptions());
//  }
//


  @override
  Future<MoviesResponse> getPopularMovies() async {
    Response response = await _dio.get(POPULAR_PATH,
        options: _serviceApi.cacheOptions());
    return new MoviesResponse.fromJson(response.data);
  }

  @override
  getSimilarMoviesByMovieId(int id) {
    return _dio.get("$SIMILAR_PATH/$id",
        options: _serviceApi.cacheOptions());
  }

  @override
  getLatestMovie() {
    return _dio.get(LATEST_PATH,
        options: _serviceApi.cacheOptions());
  }

  @override
  getMoviesInTheatres() {
    // TODO: implement getMoviesInTheatres
    return null;
  }
  
  @override
  getMovieVideoById(int id) {
    // TODO: implement getMovieVideoById
    return null;
  }
}