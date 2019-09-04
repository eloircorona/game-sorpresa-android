import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:flame/sprite.dart';

class ControllerButton {
  final BoxGame game;
  final String buttonNameString;

  Sprite buttonSprite;
  Rect buttonRect;

  int isTaped = 0;

  ControllerButton(this.game, double x, double y, this.buttonNameString) {
    buttonRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }

  void render(Canvas c) {
    buttonSprite.renderRect(c, buttonRect);
  }

  void update(double t) {
    if(isTaped == 1) {
      // print("Tapped: " + buttonNameString);
      onTapActions(0, buttonNameString);
    }
    else if(isTaped == 2) {
      // print("Untapped: " + buttonNameString);
      onTapActions(1, buttonNameString);
      isTaped = 0;
    }
  }

  void onTap(int tapped) {
    isTaped = tapped;
  }

  void onTapActions(int tapIndex, String buttonName) {
    switch (tapIndex) {
      case 0:
        
        switch (buttonName) {
          case "right":
            if(game.omarX + game.tileSize < game.screenSize.width) {
              game.omarX += 3;
              if(game.orientation == "right") {
                if(game.spriteIndex == 7) game.spriteIndex = 0;
                game.spriteIndex += 1;
              } else {
                game.orientation = "right";
                game.spriteIndex = 0;
              }
            }
            break;
          case "left":
            if(game.omarX > 0) {
              game.omarX -= 3;
              if(game.orientation == "left") {
                if(game.spriteIndex == 7) game.spriteIndex = 0;
                game.spriteIndex += 1;
              } else {
                game.orientation = "left";
                game.spriteIndex = 0;
              }
            }
            break;
          case "top":
            if(game.omarY > 0) {
              game.omarY -= 3;
              if(game.orientation == "top") {
                if(game.spriteIndex == 7) game.spriteIndex = 0;
                game.spriteIndex += 1;
              } else {
                game.orientation = "top";
                game.spriteIndex = 0;
              }
            }
            break;
          case "bottom":
            if(game.omarY + game.tileSize < game.screenSize.height) {
              game.omarY += 3;
              if(game.orientation == "bottom") {
                if(game.spriteIndex == 7) game.spriteIndex = 0;
                game.spriteIndex += 1;
              } else {
                game.orientation = "bottom";
                game.spriteIndex = 0;
              }
            }
            break;
          case "a":
            print("a");
            break;
          case "b":
            print("b");
            break;
          case "x":
            print("x"); 
            break;
          case "y":
            print("y");
            break;
          default:
        }
        break;
    }
  }
}