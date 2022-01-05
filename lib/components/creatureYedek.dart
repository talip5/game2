import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/rendering.dart';

const GRAVITY=1000;

class Creature extends AnimationComponent {
  SpriteSheet creatureSpritesheet;
  Animation _creatureAnimation;

  double speedY = 0.0;
  double maxY = 0.0;
  bool isHit;


  Creature() :super.empty() {
    creatureSpritesheet = SpriteSheet(
        imageName: "creature.png",
        textureWidth: 291,
        textureHeight: 178,
        columns: 10,
        rows: 2);

    _creatureAnimation =
        creatureSpritesheet.createAnimation(0, from: 0, to: 9, stepTime: 0.1);
    //animation = _creatureAnimation;

    isHit = false;
  }

  bool isOnGround() {
    return (y >= maxY);
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

  @override
  void resize(Size size) {
    width = height = size.width / 10;
    x = width;
    y = size.height - 30 - 130;
    maxY = y;
    super.resize(size);
  }

  void run() {
    animation = _creatureAnimation;
  }

  void hit() {
    print('creature hit');
    /* if(!isHit) {
      isHit=true;
      animation = _creatureAnimation;
    }*/
    //animation = _creatureAnimation;
  }

  void jump() {
    if (isOnGround()) {
      print('creature jump');
      speedY = -500;
    }
  }
}