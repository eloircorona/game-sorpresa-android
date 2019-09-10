import 'dart:ui';

import 'package:Sorpresa/components/background.dart';
import 'package:Sorpresa/components/button-a.dart';
import 'package:Sorpresa/components/button-b.dart';
import 'package:Sorpresa/components/button-bottom.dart';
import 'package:Sorpresa/components/button-center.dart';
import 'package:Sorpresa/components/button-left.dart';
import 'package:Sorpresa/components/button-right.dart';
import 'package:Sorpresa/components/button-top.dart';
import 'package:Sorpresa/components/button-x.dart';
import 'package:Sorpresa/components/button-y.dart';
import 'package:Sorpresa/components/controller-button.dart';
import 'package:Sorpresa/components/eloir.dart';
import 'package:Sorpresa/components/first-screen.dart';
import 'package:Sorpresa/components/heart.dart';
import 'package:Sorpresa/components/message.dart';
import 'package:Sorpresa/components/omar.dart';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {
  Size screenSize;
  double tileSize;

  FirstScreen firstScreen;
  bool firstScreenActive;

  //Back
  Back backgound;

  //Buttons
  List<ControllerButton> buttons;

  //Omar
  Omar omar;
  double omarX;
  double omarY;
  int omarSpriteIndex;
  String omarOrientation;
  bool omarIsWalking;

  //Eloir
  Eloir eloir;
  double eloirX;
  double eloirY;
  int eloirSpriteIndex;
  bool eloirIsWalking;
  String eloirOrientation;

  //Message
  Message message;
  bool showMessage;
  bool selectOption;
  bool optionYes;
  bool optionNo;
  int countMessage;
  int selectYesNo;

  //Heart
  Heart heart;
  bool showHeart;

  int timeCount;

  BoxGame() {
    initialize();
  }

  void loadFirstScreen() { 
    firstScreenActive = true;
    firstScreen = FirstScreen(this, 0, 0);
  }

  void loadButtons() {
    buttons.add(ButtonLeft(this, 30, 230, 'left'));
    buttons.add(ButtonBottom(this, 30 + tileSize, 230 + tileSize, 'bottom'));
    buttons.add(ButtonRight(this, 30 + (tileSize * 2), 230, 'right'));
    buttons.add(ButtonTop(this, 30 + tileSize, 230 - tileSize, 'top'));
    buttons.add(ButtonCenter(this, 30 + tileSize, 230, 'center'));

    buttons.add(ButtonA(this, (tileSize * 13) - 30, 230, 'a'));
    buttons.add(ButtonY(this, (tileSize * 11) - 30, 230, 'y'));
    buttons.add(ButtonX(this, (tileSize * 12) - 30, 230 - tileSize, 'x'));
    buttons.add(ButtonB(this, (tileSize * 12) - 30, 230 + tileSize, 'b'));
  }

  void loadOmar() {
    omarX = 50;
    omarY = 50;
    omarSpriteIndex = 0;
    omarOrientation = "right";
    omarIsWalking = false;
    omar = Omar(this, omarX, omarY, omarSpriteIndex, omarOrientation, omarIsWalking);
  }

  void loadEloir() {
    eloirX = screenSize.width - tileSize * 2.1;
    eloirY = -100;
    eloirSpriteIndex = 0;
    eloirIsWalking = false;
    eloirOrientation = "bottom";
    eloir = Eloir(this, eloirX, eloirY, eloirSpriteIndex, eloirIsWalking, eloirOrientation);
  }

  void loadMessage() {
    showMessage = false;
    countMessage = 0;
    selectOption = false;
    selectYesNo = 1;
    optionYes = false;
    optionNo = false;

    message = Message(this, 10, 250, countMessage);
  }

  void loadHeart() {
    showHeart = false;

    heart = Heart(this, eloirX + (tileSize / 4), eloirY - (tileSize * 1.3)); 
  }

  void initialize() async {
    buttons = List<ControllerButton>();
    resize(await Flame.util.initialDimensions());
    timeCount = 0;
    loadFirstScreen();

    backgound = Back(this, 0, 0);
    loadButtons();
    loadOmar();
    loadEloir();
    loadMessage();
    loadHeart();
  }

  void render(Canvas canvas) {
    backgound.render(canvas);
    omar.render(canvas);
    eloir.render(canvas);
    if(showMessage) message.render(canvas);
    if(showHeart) heart.render(canvas);
    buttons.forEach((ControllerButton button) => button.render(canvas));
    if(firstScreenActive) firstScreen.render(canvas);
  }

  void update(double t) {
    timeCount++;
    omar = Omar(this, omarX, omarY, omarSpriteIndex, omarOrientation, omarIsWalking);
    
    if(timeCount > 100) firstScreenActive = false; 
    if(timeCount > 200) eloirIsWalking = true;
    if(eloirIsWalking && !optionNo)
    {
      // if(eloirX > screenSize.width / 2)
      // {
      //   eloirX -= 3;
      //   if(eloirSpriteIndex == 7) eloirSpriteIndex = 0;
      //   eloirSpriteIndex++;
      // } else {
      //   eloirSpriteIndex = 2;
      // }
      if(eloirY < screenSize.height * 0.53 - tileSize * 0.2) 
      { 
        eloirY += 3;
        if(eloirSpriteIndex == 7) eloirSpriteIndex = 0;
        eloirSpriteIndex++;
      } else {
        eloirOrientation = "left";
        if(eloirX > screenSize.width * 0.6)
        {
          eloirX -= 3;
          if(eloirSpriteIndex == 7) eloirSpriteIndex = 0;
          eloirSpriteIndex++;
        } else {
          eloirSpriteIndex = 2;
          eloirIsWalking = false;
        }
      }
    }
    if(eloirIsWalking && optionNo)
    {
      eloirOrientation = "right";
      if(eloirX < screenSize.width - tileSize * 2)
      {
        eloirX += 3;
        if(eloirSpriteIndex == 7) eloirSpriteIndex = 0;
        eloirSpriteIndex++;
      } else {
        eloirOrientation = "top";
        if(eloirY > -100) {
          eloirY -= 3;
          if(eloirSpriteIndex == 7) eloirSpriteIndex = 0;
          eloirSpriteIndex++;
        }
      }
    }
    eloir = Eloir(this, eloirX, eloirY, eloirSpriteIndex, eloirIsWalking, eloirOrientation);
    if(showMessage) message = Message(this, 10, 250, countMessage);
    if(showHeart && optionYes) heart = Heart(this, eloirX + (tileSize * 0.4), eloirY - (tileSize * 0.2)); 
    buttons.forEach((ControllerButton button) => button.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 14;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    buttons.forEach( (ControllerButton button) {
      if(button.buttonRect.contains(d.globalPosition)) {
        button.onTap(1);
      }
    });
  }

  void onTapUp(TapUpDetails u) {
    buttons.forEach( (ControllerButton button) {
      if(button.buttonRect.contains(u.globalPosition)) {
        button.onTap(2);
      }
    });
  }
}