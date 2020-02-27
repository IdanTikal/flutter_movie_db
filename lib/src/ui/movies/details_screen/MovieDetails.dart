import 'package:flutter/material.dart';
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
    return CustomScrollView(
        slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.transparent,
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          background: ImageHeroAnimation(
            photo: widget.photoUrl,
          ),
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: true,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
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
