import 'package:dio/dio.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/videos/VideoModel.dart';
import 'package:flutter_movie_db/src/data/videos/VideosDataSource.dart';

import '../../MoviesServiceApi.dart';

class VideosRemoteDataSource implements VideosDataSource{
  MoviesServiceApi _serviceApi;

  VideosRemoteDataSource(this._serviceApi);

  @override
  Future<VideosResponse> getMovieVideos(int videoId) async {
     Response res = await _serviceApi.dio.get("/$videoId/$VIDEOS_PATH");
     return VideosResponse.fromJson(res.data);
  }
}
