import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Back {
  final BoxGame game;
  
  Rect backRect;
  Sprite backSprite;

  Back(this.game, double x, double y) {
    backRect = Rect.fromLTWH(x, y, game.screenSize.width, game.screenSize.height);
    backSprite = Sprite("back.jpg");
    
  }

  void render(Canvas c) {
    // backSprite.renderRect(c, backRect);
  }

  void update(double t) {
    
  }
}