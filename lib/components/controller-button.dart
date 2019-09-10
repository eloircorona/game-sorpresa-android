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
            if(!game.selectOption) 
            {
              if(
                   // Sector 1
                game.omarX > game.tileSize * 0.8 && game.omarX + game.tileSize < game.tileSize * 6.3 && game.omarY > -8 && game.omarY < game.screenSize.height - game.tileSize * 4
                || // Sector 2
                game.omarX + game.tileSize > game.tileSize * 6.3 && game.omarX < game.tileSize * 7.1 && game.omarY > -8 && game.omarY < game.screenSize.height
                || // Sector 3
                game.omarX > game.tileSize * 6.8 && game.omarX < game.tileSize * 10.8 && game.omarY > -8 && game.omarY + game.tileSize < game.tileSize * 0.9
                || // Sector 4
                game.omarX > game.tileSize * 10.8 && game.omarX < game.tileSize * 12 && game.omarY > -8 && game.omarY < game.screenSize.height - game.tileSize * 2.6
                || // Sector 5
                game.omarX > game.tileSize * 9 && game.omarX < game.tileSize * 11.4 && game.omarY > game.tileSize * 3.1 && game.omarY < game.screenSize.height - game.tileSize * 2.6
                || // Sector 6
                game.omarX > game.tileSize * 6.8 && game.omarX < game.tileSize * 9.1 && game.omarY > game.tileSize * 3.1 && game.omarY < game.screenSize.height - game.tileSize
              ) {
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
              
            }
            if(game.omarX + game.tileSize > game.screenSize.width / 2) game.eloirIsWalking = true; 
            break;
          case "left":
            if(!game.selectOption) 
            {
              if(
                // Sector 1
                game.omarX > game.tileSize && game.omarX + game.tileSize < game.tileSize * 6.8 && game.omarY > -8 && game.omarY < game.screenSize.height - game.tileSize * 4
                || // Sector 2
                game.omarX + game.tileSize > game.tileSize * 6.8 && game.omarX < game.tileSize * 7.3 && game.omarY > -8 && game.omarY < game.screenSize.height
                || // Sector 3
                game.omarX > game.tileSize * 7.1 && game.omarX < game.tileSize * 11.5 && game.omarY > -8 && game.omarY + game.tileSize < game.tileSize * 0.9
                || // Sector 4
                game.omarX > game.tileSize * 11.4 && game.omarX < game.tileSize * 12.2 && game.omarY > -8 && game.omarY < game.screenSize.height - game.tileSize * 2.6
                || // Sector 5
                game.omarX > game.tileSize * 9 && game.omarX < game.tileSize * 11.4 && game.omarY > game.tileSize * 3.1 && game.omarY < game.screenSize.height - game.tileSize * 2.6
                || // Sector 6
                game.omarX > game.tileSize * 7.1 && game.omarX < game.tileSize * 9.4 && game.omarY > game.tileSize * 3.1 && game.omarY < game.screenSize.height - game.tileSize
              ) {
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
            }
            break;
          case "top":
            if(!game.selectOption)
            {
              if(
                // Sector 1
                game.omarX > game.tileSize * 0.8 && game.omarX + game.tileSize < game.tileSize * 6.5 && game.omarY > -5 && game.omarY < game.screenSize.height - game.tileSize * 4
                || // Sector 2
                game.omarX + game.tileSize > game.tileSize * 6.3 && game.omarX < game.tileSize * 7.3 && game.omarY > -5 && game.omarY < game.screenSize.height
                || // Sector 3
                game.omarX > game.tileSize * 6.8 && game.omarX < game.tileSize * 11.1 && game.omarY > -5 && game.omarY < game.tileSize * 1.2
                || // Sector 4
                game.omarX > game.tileSize * 10.8 && game.omarX < game.tileSize * 12.3 && game.omarY > -5 && game.omarY < game.screenSize.height - game.tileSize * 2.6
                || // Sector 5
                game.omarX > game.tileSize * 9 && game.omarX < game.tileSize * 10.8 && game.omarY > game.tileSize * 3.3 && game.omarY < game.screenSize.height - game.tileSize * 2.6
                || // Sector 6
                game.omarX > game.tileSize * 6.8 && game.omarX < game.tileSize * 9.2 && game.omarY > game.tileSize * 3.3 && game.omarY < game.screenSize.height - game.tileSize * 0.8
              ) {
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
            }
            if(game.selectOption)
            {
              game.selectYesNo = game.selectYesNo == 1 ? game.selectYesNo * -1 : 1;
              game.countMessage = game.selectYesNo == 1 ? 4 : 5;
              isTaped = 0;
            }
            break;
          case "bottom":
            if(!game.selectOption)
            {
              if(
                // Sector 1
                game.omarX > game.tileSize * 0.8 && game.omarX + game.tileSize < game.tileSize * 6.5 && game.omarY > -8 && game.omarY < game.screenSize.height - game.tileSize * 4.5
                || // Sector 2
                game.omarX + game.tileSize > game.tileSize * 6.3 && game.omarX < game.tileSize * 7.3 && game.omarY > -8 && game.omarY + game.tileSize < game.screenSize.height - game.tileSize * 0.6
                || // Sector 3
                game.omarX > game.tileSize * 6.8 && game.omarX < game.tileSize * 11.1 && game.omarY > -8 && game.omarY + game.tileSize < game.tileSize * 0.8
                || // Sector 4
                game.omarX > game.tileSize * 11.3 && game.omarX < game.tileSize * 12.3 && game.omarY > -8 && game.omarY < game.screenSize.height - game.tileSize * 2.8
                || // Sector 5
                game.omarX > game.tileSize * 9 && game.omarX < game.tileSize * 10.8 && game.omarY > game.tileSize * 3.1 && game.omarY < game.screenSize.height - game.tileSize * 2.8
                || // Sector 6
                game.omarX > game.tileSize * 6.8 && game.omarX < game.tileSize * 9.2 && game.omarY > game.tileSize * 3.3 && game.omarY < game.screenSize.height - game.tileSize * 1.6
              ) {
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
                      game.eloirIsWalking = true;
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