import 'package:flame/anchor.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/time.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:game2/constants/constants.dart';

class Cat extends AnimationComponent {
  SpriteSheet catSpritesheet;
  Animation _runAnimation;
  Animation _jumpAnimation;
  Animation _hitAnimation;

  double speedY = 0.0;
  double maxY = 0.0;
  bool isHit;
  Timer _timer;
  ValueNotifier<int> life;

  Cat() : super.empty() {
    catSpritesheet = SpriteSheet(
        imageName: "cat_spritesheet.png",
        textureWidth: 32,
        textureHeight: 32,
        columns: 8,
        rows: 10);

    _runAnimation =
        catSpritesheet.createAnimation(4, from: 0, to: 7, stepTime: 0.1);
    //animation = _runAnimation;

    _hitAnimation =
        catSpritesheet.createAnimation(9, from: 0, to: 7, stepTime: 0.1);
    //animation = _hitAnimation;
    run();
    _timer = Timer(
      1,
      callback: () {
        run();
      },
      repeat: true,
    );

    isHit = false;
    anchor = Anchor.center;
    life = ValueNotifier(3);
  }

  bool isOnGround() {
    return (y >= maxY);
  }

  @override
  void update(double t) {
    speedY = speedY + gravity * t;
    y = y + speedY * t;
    if (isOnGround()) {
      y = maxY;
      speedY = 0;
    }
    _timer.update(t);
    super.update(t);
  }

  @override
  void resize(Size size) {
    width = height = size.width / 8;
    x = width;
    y = size.height - groundHeight - (height / 2);
    maxY = y;
    super.resize(size);
  }

  void run() {
    animation = _runAnimation;
    isHit = false;
  }

  void hit() {
    if (!isHit) {
      isHit = true;
      animation = _hitAnimation;

      life.value -= 1;
      _timer.start();
    }
  }

  void jump() {
    if (isOnGround()) {
      speedY = -500;
    }
  }
}
