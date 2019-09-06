import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

class Message {
  final BoxGame game;
  
  Rect messageRect;
  Sprite messageSprite;

  Message(this.game, double x, double y, int countMessage) {
    messageRect = Rect.fromLTWH(x, y, 620.0, 100.0);  
    messageSprite = Sprite("messages/message_0" + countMessage.toString() + ".png");
  }

  void render(Canvas c) {
    messageSprite.renderRect(c, messageRect);
  }

  void update(double t) {
    
  }
}