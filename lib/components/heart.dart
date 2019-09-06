import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Heart {
  final BoxGame game;
  
  Rect heartRect;
  Sprite heartSprite;

  Heart(this.game, double x, double y) {
    heartRect = Rect.fromLTWH(x, y, game.tileSize / 3, game.tileSize / 3);  
    heartSprite = Sprite("heart.png");
  }

  void render(Canvas c) {
    heartSprite.renderRect(c, heartRect);
  }

  void update(double t) {
    
  }
}