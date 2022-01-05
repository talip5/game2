import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/rendering.dart';

const GRAVITY=1000;

class Cat extends AnimationComponent{
  SpriteSheet catSpritesheet;
  Animation _runAnimation;
  Animation _jumpAnimation;
  double speedY=0.0;
  double maxY=0.0;


  Cat():super.empty(){
    catSpritesheet = SpriteSheet(
        imageName: "cat_spritesheet.png",
        textureWidth: 32,
        textureHeight: 32,
        columns: 8,
        rows: 10);


    _runAnimation =
        catSpritesheet.createAnimation(4, from: 0, to: 7, stepTime: 0.1);
    //animation = _runAnimation;

    _jumpAnimation =
        catSpritesheet.createAnimation(5, from: 0, to: 7, stepTime: 0.1);
    animation = _jumpAnimation;


  }

  bool isOnGround(){
    return(y>=maxY);
  }

  @override
  void resize(Size size) {
    width = height=size.width/10;
    x = width;
    y = size.height - 30 - height;
    maxY=y;
    super.resize(size);
  }

  @override
  void update(double t) {
    speedY=speedY + GRAVITY * t;
    y = y + speedY * t;
    if(isOnGround()){
      y=maxY;
      speedY=0;
    }
    super.update(t);
  }


  void run(){
    animation=_runAnimation;
  }

  void hit(){
    animation=_jumpAnimation;
  }

  void jump(){
    if(isOnGround()){
      speedY=-500;
    }
  }
}