import 'package:flutter_movie_db/src/data/videos/VideoModel.dart';

abstract class VideosDataSource{
  Future<dynamic> getMovieVideos(int movieId);
}