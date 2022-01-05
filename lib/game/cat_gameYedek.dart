import 'package:flame/components/animation_component.dart';
import 'package:flame/game.dart';
import 'package:flame/spritesheet.dart';

class CatGame extends BaseGame {
  AnimationComponent _cat;
  AnimationComponent _cocuk;
  AnimationComponent _kaplan;
  AnimationComponent _spletingChildren;

  SpriteSheet catSpritesheet;
  SpriteSheet cocukSpritesheet;
  SpriteSheet kaplanSpriteSheet;
  SpriteSheet splitingChildren;

  CatGame() {
    catSpritesheet = SpriteSheet(
        imageName: "cat_spritesheet.png",
        textureWidth: 32,
        textureHeight: 32,
        columns: 8,
        rows: 10);

    cocukSpritesheet = SpriteSheet(
        imageName: "cocukspritesheet.png",
        textureWidth: 192,
        textureHeight: 179,
        columns: 10,
        rows: 2);

    kaplanSpriteSheet = SpriteSheet(
        imageName: "sonic.png",
        textureWidth: 87,
        textureHeight: 121,
        columns: 10,
        rows: 5);

    splitingChildren = SpriteSheet(
        imageName: "splattingchilderen1.png",
        textureWidth: 112,
        textureHeight: 240,
        columns: 6,
        rows: 1);

    _cat = AnimationComponent.empty();
    _cocuk = AnimationComponent.empty();
    _kaplan = AnimationComponent.empty();
    _spletingChildren = AnimationComponent.empty();

    final _runAnimation =
    catSpritesheet.createAnimation(4, from: 0, to: 7, stepTime: 0.1);
    _cat.animation = _runAnimation;

    final _runAnimation1 =
    cocukSpritesheet.createAnimation(1, from: 0, to: 9, stepTime: 0.1);
    _cocuk.animation = _runAnimation1;

    final _runAnimation2 =
    kaplanSpriteSheet.createAnimation(1, from: 0, to: 4, stepTime: 0.1);
    _kaplan.animation = _runAnimation2;

    final _runAnimation3 =
    splitingChildren.createAnimation(0, from: 0, to: 5, stepTime: 0.1);
    _spletingChildren.animation = _runAnimation3;




    _cat.width = 150;
    _cat.height = 150;
    _cat.x = 100;
    _cat.y = 200;

    _cocuk.width = 192;
    _cocuk.height = 179;
    _cocuk.x = 300;
    _cocuk.y = 100;

    _kaplan.width=97;
    _kaplan.height=121;
    _kaplan.x=0;
    _kaplan.y=0;



    _spletingChildren.width=114;
    _spletingChildren.height=240;
    _spletingChildren.x=50;
    _spletingChildren.y=100;

    add(_cat);
    add(_cocuk);
    add(_kaplan);
    add(_spletingChildren);
  }
}
