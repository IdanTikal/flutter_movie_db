import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:parallax_image/parallax_image.dart';

class MovieCard extends StatelessWidget {
  final MovieModel _movieModel;
  MovieCard(this._movieModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        ListTile(

          title: Text(_movieModel.title,
          ),
          subtitle: Text(_movieModel.releaseDate,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25)),
        ),

        Container(
          height: 200,
          width: double.infinity,
          decoration: new BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            child: ParallaxImage(
              extent: 1,
              image: CachedNetworkImageProvider(
                "$IMAGE_PATH_URL${_movieModel.posterPath}",
              ),
              child: InkWell(
                enableFeedback: true,
                onTap: () {
                  print('Card tapped.');
                }, ),
            ),
          ),
        )
      ]),
    );
  }
}
