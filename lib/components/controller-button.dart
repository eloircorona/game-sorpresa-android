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
      // onTapActions(1, buttonNameString);
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
            if(!game.selectOption && game.omarX + game.tileSize < game.screenSize.width) 
            {
              if(
                game.omarX >= game.eloirX ||
                game.omarX + game.tileSize * 0.6 <= game.eloirX ||
                game.omarY + game.tileSize * 0.6 <= game.eloirY ||
                game.omarY >= game.eloirY + game.tileSize * 0.6
              ) {
                game.omarX += 3;
                if(game.omarOrientation == "right") {
                  if(game.omarSpriteIndex == 7) game.omarSpriteIndex = 0;
                  game.omarSpriteIndex += 1;
                } else {
                  game.omarOrientation = "right";
                  game.omarSpriteIndex = 0;
                }
              }
            }
            if(game.omarX + game.tileSize > game.screenSize.width / 2) game.eloirIsWalking = true; 
            break;
          case "left":
            if(!game.selectOption && game.omarX > 0 ) 
            {
              if(
                game.omarX <= game.eloirX ||
                game.omarX >= game.eloirX + game.tileSize * 0.6 ||
                game.omarY >= game.eloirY + game.tileSize * 0.6 ||
                game.omarY + game.tileSize * 0.6 <= game.eloirY
              ) {
                game.omarX -= 3;
                if(game.omarOrientation == "left") {
                  if(game.omarSpriteIndex == 7) game.omarSpriteIndex = 0;
                  game.omarSpriteIndex += 1;
                } else {
                  game.omarOrientation = "left";
                  game.omarSpriteIndex = 0;
                }
              }
            }
            break;
          case "top":
            if(!game.selectOption && game.omarY > 0)
            {
              if(
                game.omarY <= game.eloirY ||
                game.omarY >= game.eloirY + game.tileSize * 0.6 ||
                game.omarX >= game.eloirX + game.tileSize * 0.6 ||
                game.omarX + game.tileSize * 0.6 <= game.eloirX
              ) {
                game.omarY -= 3;
                if(game.omarOrientation == "top") {
                  if(game.omarSpriteIndex == 7) game.omarSpriteIndex = 0;
                  game.omarSpriteIndex += 1;
                } else {
                  game.omarOrientation = "top";
                  game.omarSpriteIndex = 0;
                }
              }
            }
            if(game.selectOption)
            {
              game.selectYesNo = game.selectYesNo == 1 ? game.selectYesNo * -1 : 1;
              game.countMessage = game.selectYesNo == 1 ? 4 : 5;
              isTaped = 0;
            }
            break;
          case "bottom":
            if(!game.selectOption && game.omarY + game.tileSize < game.screenSize.height)
            {
              if(
                game.omarY >= game.eloirY ||
                game.omarY + game.tileSize * 0.6 <= game.eloirY ||
                game.omarX + game.tileSize * 0.6 <= game.eloirX ||
                game.omarX >= game.eloirX + game.tileSize * 0.6
              ) {
                game.omarY += 3;
                if(game.omarOrientation == "bottom") {
                  if(game.omarSpriteIndex == 7) game.omarSpriteIndex = 0;
                  game.omarSpriteIndex += 1;
                } else {
                  game.omarOrientation = "bottom";
                  game.omarSpriteIndex = 0;
                }
              }
            }
            if(game.selectOption)
            {
              game.selectYesNo = game.selectYesNo == -1 ? game.selectYesNo * -1 : -1;
              game.countMessage = game.selectYesNo == 1 ? 4 : 5;
              isTaped = 0;
            }
            break;
          case "a":
          case "b":
          case "x":
          case "y":
            if(!game.showHeart && !game.optionNo &&
              game.omarX > (game.screenSize.width / 7) * 3 &&
              game.omarX < (game.screenSize.width / 7) * 4 &&
              game.omarY > (game.screenSize.height / 3) * 1 &&
              game.omarY < (game.screenSize.height / 3) * 2 &&
              game.omarOrientation == "right"
              ) {
                if(game.showMessage)
                {
                  switch (game.countMessage) {
                    case 0:
                    case 1:
                    case 2:
                      game.countMessage++;
                      break;
                    case 3:
                      game.countMessage++;
                      game.selectOption = true;
                      break;
                    case 4:
                      game.countMessage = 6;
                      game.showHeart = true;
                      game.optionYes = true;
                      game.selectOption = false;
                      break;
                    case 5:
                      game.showMessage = false;
                      game.optionNo = true;
                      game.selectOption = false;
                      break;
                  }
                } else if(!game.showHeart) game.showMessage = true;
                isTaped = 0;
              }
            break;
          default:
        }
        break;
    }
  }
}