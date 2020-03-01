import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/ImageHeroAnimation.dart';

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
              width: 100,
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
