import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/assets/Colors.dart';
import 'package:flutter_movie_db/assets/Strings.dart';
import 'package:flutter_movie_db/src/data/MoviesUriPaths.dart';
import 'package:flutter_movie_db/src/data/movies/MovieModel.dart';
import 'package:parallax_image/parallax_image.dart';

class ParallaxList extends StatefulWidget {
  final Stream<List<MovieModel>> listStream;

  ParallaxList(this.listStream);

  @override
  _ParallaxListState createState() => _ParallaxListState();
}

class _ParallaxListState extends State<ParallaxList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.app_name),
        backgroundColor: primaryColor,
      ),
      body: StreamBuilder<List<MovieModel>>(
          stream: widget.listStream,
          builder: (context, snapshot) {
            return getListView(snapshot);
          }),
    );
  }
}

getListView(AsyncSnapshot<List<MovieModel>> snapshot) {
  if (snapshot.hasData) {
//    return getGrid(snapshot.data);
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == snapshot.data.length - 5) {
//          _loadMore();
        }
        return cardView(snapshot.data[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.redAccent,
        thickness: 0.01,
      ),
    );
  } else {
    return Center(
      child: Text("Empty List Hang On :)",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: primaryColor, fontSize: 40)),
    );
  }
}

Widget cardView(MovieModel movieModel) {
  print("CardView");
  return Container(
    decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        ),
    child: Column(children: [
      Text(movieModel.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20)),
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
          child: ParallaxImage(
            extent: 1,
            image: CachedNetworkImageProvider(
              "$IMAGE_PATH_URL${movieModel.posterPath}",
              scale: 1,
            ),
            child: InkWell(onTap: () {
              print('Card tapped.');
            }),
          ),
        ),
      )
    ]),
  );
}

Widget getGrid(List<MovieModel> list) {
  return GridView(
    padding: EdgeInsets.all(10),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1,
    ),
    children: list.map((movieModel) => cardView(movieModel)).toList(),
  );
}
