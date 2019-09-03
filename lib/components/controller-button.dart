import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class ControllerButton {
  final BoxGame game;

  Sprite buttonSprite;
  Rect buttonRect;

  bool isTaped = false;

  ControllerButton(this.game, double x, double y, String buttonName) {
    buttonRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }

  void render(Canvas c) {
    buttonSprite.renderRect(c, buttonRect);
  }

  void update(double t) {
    if(!isTaped) {
      // 
    }
    else {
      // 
    }
  }

  void onTap(bool tapped) {
    isTaped = tapped;
  }
}