import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Eloir {
  final BoxGame game;
  
  Rect eloirRect;
  Paint eloirPaint;
  Sprite eloirSprite;

  Eloir(this.game, double x, double y, int spriteIndex, bool isWalking) {
    eloirRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    eloirPaint = Paint();
    eloirPaint.color = Color(0xff6ab04c);

    eloirSprite = Sprite("eloir_walking_left/tile00" + spriteIndex.toString() + ".png");
    
  }

  void render(Canvas c) {
    eloirSprite.renderRect(c, eloirRect);
  }

  void update(double t) {
    
  }
}