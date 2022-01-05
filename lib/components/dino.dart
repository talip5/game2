import 'dart:ui';
import 'package:flame/components/animation_component.dart';
import 'package:flame/game.dart';
import 'package:flutter/rendering.dart';
import 'package:flame/components/component.dart';
import 'package:game2/game/cat_game.dart';
import 'package:game2/game/cat_game.dart';
import 'package:game2/game/cat_game.dart';

class Dino extends SpriteComponent{

  String name='xxx';
  SpriteComponent _spriteComponent=SpriteComponent.square(150, "DinoSprites_mort.gif");
  Dino() {
    _spriteComponent=SpriteComponent.square(150, "DinoSprites_mort.gif");
  }

  Component get _ => _spriteComponent;
}