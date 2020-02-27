import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:rxdart/rxdart.dart';

class ImageHeroAnimation extends StatefulWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;
  final BehaviorSubject<bool> _parallaxBehavior = BehaviorSubject<bool>();
  Stream<bool> get parallaxBehavior => _parallaxBehavior.stream;

  ImageHeroAnimation({Key key, this.photo, this.onTap, this.width, })
      : super(key: key){
    _parallaxBehavior.sink.add(true);
  }

  @override
  _ImageHeroAnimationState createState() => _ImageHeroAnimationState();
}

class _ImageHeroAnimationState extends State<ImageHeroAnimation> {


  Widget build(BuildContext context) {
    print("BuildContext ");

    return StreamBuilder<bool>(
      stream: widget.parallaxBehavior,
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data ? withParallax() : withoutParallax();
      },
    );
  }

   onImageClicked() {
     print("onImageClicked");
     widget.onTap();
     return;
    widget.parallaxBehavior.first.then((parallax) {
    print("parallax: $parallax");
    widget._parallaxBehavior.sink.add(!parallax);
    Future.delayed(Duration(milliseconds: 200), ()=> widget.onTap());
        Future.delayed(Duration(seconds: 1), ()=> widget._parallaxBehavior.sink.add(!parallax));
    }).catchError((error) => print(error)).whenComplete(() => print("Completed"));
  }

  SizedBox withParallax() {
    return SizedBox(
      width: widget.width,
      child: Hero(
        tag: widget.photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onImageClicked,
            child: ParallaxImage(
              image: CachedNetworkImageProvider(widget.photo),
              extent: 1,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox withoutParallax() {
    return SizedBox(
      width: widget.width,
      child: Hero(
        tag: widget.photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onImageClicked,
            child: CachedNetworkImage(imageUrl: widget.photo, fit: BoxFit.fitWidth,),
          ),
        ),
      ),
    );
  }
}
