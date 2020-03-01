import 'package:flutter_movie_db/src/data/videos/VideoModel.dart';
import 'package:flutter_movie_db/src/data/videos/VideosDataSource.dart';
import 'package:flutter_movie_db/src/data/videos/remote/VideosRemoteDataSource.dart';

import '../MoviesServiceApi.dart';

class VideosRepository implements VideosDataSource{
  final VideosRemoteDataSource _remoteDataSource = VideosRemoteDataSource(MoviesServiceApi());

  @override
  Future<List<VideoModel>> getMovieVideos(int movieId) async {
    VideosResponse res = await _remoteDataSource.getMovieVideos(movieId);
    return res.results;
  }

}