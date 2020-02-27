import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/ImageHeroAnimation.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movieModel;
  final String photoUrl;

  MovieDetails({Key key, this.movieModel, this.photoUrl}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          backgroundColor: primaryColor,
          expandedHeight: 250.0,
          floating: true,
          pinned: true,
          snap: true,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
//            centerTitle: true,
            title: Text(
              widget.movieModel.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            background: ImageHeroAnimation(
              photo: widget.photoUrl,
            ),
          )),
      SliverFillRemaining(
        hasScrollBody: true,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[],
            ),
          ],
        ),
      ),
    ]);
  }
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//      ImageHeroAnimation(
//        photo: widget.photoUrl,
//        width: double.infinity,
//      ),
//      Container(
//        height: ,
//      )
//    ],
//
//    );
//  }
}
