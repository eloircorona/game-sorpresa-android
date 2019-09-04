import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Omar {
  final BoxGame game;
  
  Rect omarRect;
  Paint omarPaint;
  Sprite omarSprite;

  Omar(this.game, double x, double y, int spriteIndex, String orientation, bool isWalking) {
    omarRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    omarPaint = Paint();
    omarPaint.color = Color(0xff6ab04c);

    omarSprite = Sprite("omar_walking_" + orientation + "/tile00" + spriteIndex.toString() + ".png");
    
  }

  void render(Canvas c) {
    omarSprite.renderRect(c, omarRect);
  }

  void update(double t) {
    
  }
}