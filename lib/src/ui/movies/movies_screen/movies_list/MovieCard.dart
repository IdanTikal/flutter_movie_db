import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/details_screen/MovieDetails.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/ImageHeroAnimation.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/TextHeroAnimation.dart';
import 'package:parallax_image/parallax_image.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  final VoidCallback onTap;

  MovieCard({Key key, this.movieModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        ListTile(
          onTap: onTap,
          title: Text(movieModel.title,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25)
          ),
          subtitle: Text(movieModel.releaseDate,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20)),
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
            child: ImageHeroAnimation(
              photo: movieModel.getPosterDownloadUrl,
              width: double.infinity,
              onTap: onTap,
            ),
//            child: ParallaxImage(
//              extent: 1,
//              image: CachedNetworkImageProvider(
//                "$IMAGE_PATH_URL${movieModel.posterPath}",
//              ),
//              child: InkWell(
//                enableFeedback: true,
//                onTap: () {
//                  print('Card tapped.');
//                }, ),
//            ),
          ),
        )
      ]),
    );
  }
}
