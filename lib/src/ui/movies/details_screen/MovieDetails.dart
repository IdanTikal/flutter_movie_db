import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:flutter_movie_db/src/data/videos/VideoModel.dart';
import 'package:flutter_movie_db/src/data/videos/VideosRepository.dart';
import 'package:flutter_movie_db/src/ui/movies/widgets/ImageHeroAnimation.dart';
import 'package:sliver_fill_remaining_box_adapter/sliver_fill_remaining_box_adapter.dart';

import 'MovieDetailsBloc.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movieModel;

  MovieDetails({Key key, this.movieModel}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  VideosRepository _repository = VideosRepository();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    List<VideoModel> videos =
        await _repository.getMovieVideos(widget.movieModel.id);
    print("VIDEOS: $videos");
  }

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
            widget.movieModel.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          background: ImageHeroAnimation(
            photo: widget.movieModel.getPosterDownloadUrl,
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
          widget.movieModel.overview,
        ),
        buildSectionHeader("Overview"),
        buildSectionBody(
          widget.movieModel.overview,
        ),            buildSectionHeader("Overview"),
        buildSectionBody(
          widget.movieModel.overview,
        ),            buildSectionHeader("Overview"),
        buildSectionBody(
          widget.movieModel.overview,
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
