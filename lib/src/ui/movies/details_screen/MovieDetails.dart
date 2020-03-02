import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
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
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: primaryColor,
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(widget.movieModel.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    background: ImageHeroAnimation(
                      parallax: false,
                      photo: widget.movieModel.getPosterDownloadUrl,
                    )),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: primaryColor,
                    labelColor: primaryColor,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontSize: 16),
                    tabs: [
                      Tab(
                          icon: Icon(
                            Icons.info,
                          ),
                          text: "Info"),
                      Tab(
                          icon: Icon(
                            Icons.comment,
                          ),
                          text: "Comments"),
                      Tab(
                          icon: Icon(Icons.ondemand_video,
                          ),
                          text: "Videos"),
                    ],
                  ),
                ),
              ),
            ];
          }, body: TabBarView(
          children: <Widget>[
//            MovieOverview(),
//            MovieComments(),
//            MovieVideos(),

          ],
        ),

          ),
        ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    MovieDetailsBloc();
    return WillPopScope(
      onWillPop: () => widgetWillPop(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: DefaultTabController(
          child: CustomScrollView(slivers: <Widget>[
            buildSliverAppBar(),
            buildSliverFillRemaining(),
          ]), length: 2,
        ),
      ),
    );
  }
*/

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.black.withOpacity(0.8),
      expandedHeight: 250.0,
      floating: true,
      pinned: true,
      snap: true,
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
          parallax: false,
          photo: widget.movieModel.getPosterDownloadUrl,
        ),
      ),
      bottom: TabBar(
        labelStyle: TextStyle(fontSize: 25),
        isScrollable: true,
        labelColor: Colors.black87,
        unselectedLabelColor: Colors.grey,
        tabs: [
          new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
          new Tab(icon: new Icon(Icons.lightbulb_outline), text: "Tab 2"),
        ],
      ),
    );
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
        ),
        buildSectionHeader("Overview"),
        buildSectionBody(
          widget.movieModel.overview,
        ),
        buildSectionHeader("Overview"),
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
