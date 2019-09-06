import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class FirstScreen {
  final BoxGame game;
  
  Rect backRect;
  Paint backPaint;

  Rect iconRect;
  Sprite iconSprite;

  FirstScreen(this.game, double x, double y) {
    backRect = Rect.fromLTWH(x, y, game.screenSize.width, game.screenSize.height);
    backPaint = Paint();
    backPaint.color = Color(0xff000000);

    iconRect = Rect.fromLTWH(game.screenSize.width / 2 - 75, game.screenSize.height / 2 - 75, 150.0, 150.0);
    iconSprite = Sprite("launcher/game_icon.png");
  }

  void render(Canvas c) {
    c.drawRect(backRect, backPaint);
    iconSprite.renderRect(c, iconRect);
  }

  void update(double t) {
    
  }
}