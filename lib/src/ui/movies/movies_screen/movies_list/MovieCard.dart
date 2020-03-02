import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/ImageHeroAnimation.dart';
import 'package:parallax_image/parallax_image.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  final VoidCallback onTap;
  final double height;
  final double width;
  final ScrollController scrollController;

  MovieCard({Key key, this.movieModel, this.height, this.width, this.onTap, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(children: <Widget>[
        renderImage(),
        Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[renderHeader(), renderFooter()]),
        ),
      ]),
    );
  }

  Widget renderHeader() {
    return Container(
      color: Colors.black12.withOpacity(0.8),
      child: ListTile(
        onTap: onTap,
        title: Text(movieModel.title,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25)),
        subtitle: Text(movieModel.releaseDate,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20)),
      ),
    );
  }

  Widget renderFooter() {
    return Container(
      color: Colors.black12.withOpacity(0.8),
      child: ListTile(
        onTap: onTap,
        title: Text(movieModel.title,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20)),
        subtitle: Text(movieModel.releaseDate,
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16)),
      ),
    );
  }

  Widget renderImage() {
    return Container(
        height: height,
        width: double.infinity,
        child: ImageHeroAnimation(
          scrollController: scrollController,
          parallax: true,
          photo: movieModel.getPosterDownloadUrl,
        )
//        ParallaxImage(
//          image: CachedNetworkImageProvider(movieModel.getPosterDownloadUrl),
//          extent: 10,
//        )
    );
//      child: ParallaxImage(
//          extent: 1,
//          image: CachedNetworkImageProvider(
//            movieModel.getPosterDownloadUrl,
//          )),
//    );
////          child: ImageHeroAnimation(
////            photo: movieModel.getPosterDownloadUrl,
////          ),
//        ));
  }
}
