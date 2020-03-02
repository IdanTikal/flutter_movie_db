import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/ImageHeroAnimation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  final VoidCallback onTap;
  final double height;
  final double width;
  final ScrollController scrollController;
  final bool flipDirection;
  final bool parallax;

  MovieCard(
      {Key key,
      this.movieModel,
      this.height,
      this.width,
      this.onTap,
      this.scrollController,
      this.flipDirection = false, this.parallax = false});

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
        _renderDetails(context),
      ]),
    );
  }

  Container _renderDetails(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width,
        child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              listTileContainer(width, renderHeader()),
              listTileContainer(width, renderFooter())
            ]),
      );
  }

  Widget listTileContainer(double width, Widget tile) {
    return Container(
      width: width,
      color: Colors.black12.withOpacity(0.5),
      child: tile,
    );
  }

  Widget renderFooter() {
    print(movieModel.voteAverage);
    return Center(
      child: RatingBar(
        itemSize: 50,
        initialRating: movieModel.voteAverage / 2,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Image.asset(
          "lib/assets/mdb.png",
          color: primaryColor,
        ),
        onRatingUpdate: null,
      ),
    );
  }

  Widget renderHeader() {
    return ListTile(
      onTap: onTap,
      title: Text(movieModel.title,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20)),
      subtitle: Text(movieModel.releaseDate,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16)),
    );
  }

  Widget renderImage() {
    return Container(
        height: height,
        width: double.infinity,
        child: ImageHeroAnimation(
          flipDirection: flipDirection,
          scrollController: scrollController,
          parallax: parallax,
          photo: movieModel.getPosterDownloadUrl,
        ));
  }
}
