import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/rendering.dart';

class Enemy extends AnimationComponent{
  SpriteSheet catSpritesheet;
  Animation _runAnimation;
  double _speed=100;
  Size screenSize;

  Enemy():super.empty(){
    catSpritesheet = SpriteSheet(
        imageName: "Hyena_walk.png",
        textureWidth: 48,
        textureHeight: 48,
        columns: 6,
        rows: 1);


    _runAnimation =
        catSpritesheet.createAnimation(0, from: 0, to: 5, stepTime: 0.1);
    animation = _runAnimation;
  }

  @override
  void resize(Size size) {
    width = height=size.width/10;
    x = size.width + width - 150;
    y = size.height - 30 - height;
    screenSize=size;
    //maxY=y;
    super.resize(size);
  }

  @override
  void update(double t) {
    //x = x - (_speed * t);
    x -= (_speed * t);
    if(x < -width){
      x = screenSize.width + width;
    }
    super.update(t);
  }
}