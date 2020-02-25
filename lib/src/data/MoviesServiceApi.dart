import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_movie_db/src/data/movies/MoviesDataSource.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';

class MoviesServiceApi implements RemoteMoviesDataSource {
  Dio _dio = _MoviesService()._dio;
  //TODO: handle forceUpdate (forceRefresh: true)
  Options _buildCacheOptions = buildCacheOptions(Duration(days: 1), maxStale: Duration(days: 7));

  static final MoviesServiceApi _singleton = MoviesServiceApi._internal();

  factory MoviesServiceApi() {
    return _singleton;
  }

  MoviesServiceApi._internal();

  @override
  getLatestMovie() {
    return _dio.get(LATEST_PATH,
        options: _buildCacheOptions);
  }

  @override
  getMoviesInTheatres() {
    return _dio.get(NOW_PLAYING_PATH,
        options: _buildCacheOptions);
  }

  @override
  getPopularMovies() {
    return _dio.get(POPULAR_PATH,
        options: _buildCacheOptions);
  }

  @override
  getSimilarMoviesByMovieId(int id) {
    return _dio.get("$SIMILAR_PATH/$id",
        options: _buildCacheOptions);
  }

  @override
  getMovieReviewsByMovieId(int id) {
    return _dio.get("$REVIEWS_PATH/$id",
        options: _buildCacheOptions);
  }

  @override
  getMovieVideoById(int id) {
    return _dio.get("$VIDEOS_PATH/$id",
        options: _buildCacheOptions);
  }
}

class _MoviesService {
  Dio _dio;

  _MoviesService() {
    BaseOptions options = new BaseOptions(
      baseUrl: BASE_URL,
      queryParameters: {API_KEY_PREFIX: API_KEY, LANGUAGE_PREFIX: LANGUAGE_EN},
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = new Dio(options);
    handleInterceptors();
  }

  handleInterceptors() {
    _dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: _dio.options.baseUrl))
            .interceptor);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // Do something before request is sent
      print("request: ${options.uri}");
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) async {
      // Do something with response data
      print("response: $response");
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      print("Error: $e");
      return e; //continue
    }));
  }
}
