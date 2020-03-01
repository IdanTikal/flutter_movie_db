import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/ui/movies/details_screen/MovieDetailsBloc.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/ImageHeroAnimation.dart';
import 'package:sliver_fill_remaining_box_adapter/sliver_fill_remaining_box_adapter.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieModel;

  MovieDetails({Key key, this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetailsBloc();
    return WillPopScope(
      onWillPop: () => widgetWillPop(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(slivers: <Widget>[
          buildSliverAppBar(),
          buildSliverFillRemaining(),
        ]),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        expandedHeight: 250.0,
//        floating: true,
        pinned: true,
//        snap: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          title: Text(
            movieModel.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          background: ImageHeroAnimation(
            photo: movieModel.getPosterDownloadUrl,
          ),
        ));
  }

  Widget buildSliverFillRemaining() {
    return SliverFillRemainingBoxAdapter(
      child: buildRemainingView(),
    );
  }

  Widget buildRemainingView() {
    return Column(
      children: <Widget>[
        buildSectionHeader("Overview"),
        buildSectionBody(
          movieModel.overview,
        ),
        buildSectionHeader("Overview"),
        buildSectionBody(
          movieModel.overview,
        ),            buildSectionHeader("Overview"),
        buildSectionBody(
          movieModel.overview,
        ),            buildSectionHeader("Overview"),
        buildSectionBody(
          movieModel.overview,
        ),
      ],
    );
  }

  Container buildSectionBody(String text) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 5),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Padding buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  widgetWillPop() {
    print("XXX: WillPopScope");
    return Future.value(true);
  }
}
