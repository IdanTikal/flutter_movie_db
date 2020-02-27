import 'package:flutter/material.dart';

class TextHeroAnimation extends StatelessWidget {
  TextHeroAnimation({ Key key, this.textWidget}) : super(key: key);

  final Text textWidget;

  Widget build(BuildContext context) {
    return Hero(
        tag: textWidget.data,
        child: textWidget
    );
  }
}