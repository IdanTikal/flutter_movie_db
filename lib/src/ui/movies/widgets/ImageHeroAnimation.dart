import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parallax/flutter_parallax.dart';

class ImageHeroAnimation extends StatelessWidget {
  final String photo;
  final double width;
  final double height;
  final bool parallax;
  final bool flipDirection;
  final ScrollController scrollController;

  ImageHeroAnimation(
      {Key key,
      this.photo,
      this.width,
      this.height,
      this.parallax = false,
      this.flipDirection = false,
      this.scrollController,
      })
      : super(key: key);

  Widget build(BuildContext context) {
//    timeDilation = 5.0;
    return this.parallax
        ? _createHeroContainer(_getImageWithParallax())
        : _createHeroContainer(_getImage());
  }

  Widget _createHeroContainer(Widget image) {
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
        child: image,
      ),
    );
  }

  Widget _getImageWithParallax() {
    return Parallax.inside(
        child: _getImage(),
        flipDirection: this.flipDirection,
        mainAxisExtent: 100.0);
  }

  CachedNetworkImage _getImage() {
    return CachedNetworkImage(imageUrl: photo, fit: BoxFit.fill);
  }
}
