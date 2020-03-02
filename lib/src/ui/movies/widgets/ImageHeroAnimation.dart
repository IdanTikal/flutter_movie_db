import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:path/path.dart';

class ImageHeroAnimation extends StatelessWidget {
  final String photo;
  final double width;
  final double height;
  final bool parallax;
  final ScrollController scrollController;

  ImageHeroAnimation(
      {Key key,
      this.photo,
       this.width,
       this.height,
      this.parallax = false, this.scrollController})
      : super(key: key);

  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return this.parallax ? withParallax() : withoutParallax();
  }

  Widget withParallax() {
//    return CachedNetworkImage(
//      imageUrl: photo,
//      fit: BoxFit.fitWidth,
//    );
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
         placeholderBuilder: (context, size, widget) {
           return Container(
             width: width,
             height: height,
             child: CircularProgressIndicator(),
           );
         },
        tag: photo,
        child:  ParallaxImage(
          image: CachedNetworkImageProvider(photo),
          extent: 100.0,
          controller: scrollController,
        ),
      ),
    );
  }

  Widget withoutParallax() {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: photo,
        child: CachedNetworkImage(imageUrl: photo, fit: BoxFit.contain),
      ),
    );
  }
}
