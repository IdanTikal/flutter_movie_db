import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:rxdart/rxdart.dart';

class ImageHeroAnimation extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;
  final bool parallax;

  ImageHeroAnimation(
      {Key key, this.photo, this.onTap, this.width, this.parallax = false})
      : super(key: key);

  Widget build(BuildContext context) {
    return this.parallax ? withParallax() : withoutParallax();
  }

  onImageClicked() {
    onTap();
    return;
  }

  SizedBox withParallax() {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onImageClicked,
            child: ParallaxImage(
              image: CachedNetworkImageProvider(photo),
              extent: 1,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox withoutParallax() {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onImageClicked,
            child: CachedNetworkImage(imageUrl: photo, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
