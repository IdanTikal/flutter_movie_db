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
  final int gridCount;

  MovieCard(
      {Key key,
      this.movieModel,
      this.height,
      this.width,
      this.onTap,
      this.scrollController,
      this.flipDirection = false,
      this.parallax = false,
      this.gridCount = 1});

  @override
  Widget build(BuildContext context) {
    bool p = gridCount != null && gridCount > 1 ? false : parallax;

    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.black,
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(children: <Widget>[
          renderImage(),
//          true ? _renderDetails(context) : Container(),
          gridCount < 4 ? Positioned(
            child: _infoContainer(renderHeader()),
            top: 0,
            left: 0,
            right: 0,
          ) : Container(),
          gridCount < 4 ? FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              if (!snapshot.hasData){
                return Container();
              }
              double width = snapshot.data;
              return Positioned(
                child: _infoContainer(renderFooter(width)),
                bottom: 0,
                left: 0,
                right: 0,
              );
            },
            future: Future.delayed(Duration(microseconds: 1), ()=> context.size.width),
          ) : Container()
        ]),
      ),
    );
  }

  Widget _infoContainer(Widget tile) {
    return Container(
      color: Colors.black12.withOpacity(0.5),
      child: tile,
    );
  }

  Widget renderFooter(double width) {
    int itemCount = 5;
    double ratingItemSize = (width ~/ (itemCount+1)).toInt().toDouble();
    ratingItemSize = gridCount >= 2 ? ratingItemSize * 2 : ratingItemSize;
    return Center(
      child: RatingBar(
        itemSize: ratingItemSize,
        initialRating: movieModel.voteAverage / 2,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: itemCount,
        itemPadding: EdgeInsets.symmetric(horizontal:                                                                                                        4.0),
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
    bool parallax = gridCount != null && gridCount > 1 ? false : this.parallax;

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
