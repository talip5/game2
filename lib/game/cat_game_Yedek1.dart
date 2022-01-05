import 'dart:ui';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game2/components/cat.dart';

class CatGame extends BaseGame with TapDetector{
  ParallaxComponent _parallaxComponent;
  Cat _cat;

  CatGame() {

    _parallaxComponent=ParallaxComponent(
      [
        ParallaxImage("parallax/7.png"),
        ParallaxImage("parallax/6.png"),
        ParallaxImage("parallax/5.png"),
        ParallaxImage("parallax/4.png"),
        ParallaxImage("parallax/3.png"),
        ParallaxImage("parallax/2.png"),
        ParallaxImage("parallax/1.png"),
      ],
      baseSpeed: Offset(100,0),
      layerDelta:  Offset(20,0),

    );
    _cat=Cat();
    add(_parallaxComponent);
    //_cat.hit();
    _cat.run();
    add(_cat);

  }
  @override
  void onTapDown(TapDownDetails details) {
    debugPrint('clicked!');
    _cat.jump();
    super.onTapDown(details);
  }
}
