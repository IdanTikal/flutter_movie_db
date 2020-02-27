import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:parallax_image/parallax_image.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  final Axis direction;

  MovieCard({Key key, this.movieModel, this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 16,
      child: Container(
        height: 200,
        decoration: new BoxDecoration(
          border: BoxBorder(),
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ParallaxImage(
          extent: 1,
          image: CachedNetworkImageProvider(
            "$IMAGE_PATH_URL${movieModel.posterPath}",
          ),
          child: InkWell(
            enableFeedback: true,
            onTap: () {
              print('Card tapped.');
            },
          ),
        ),
      ),
    );
  }
}
