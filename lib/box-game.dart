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
import 'package:Sorpresa/components/omar.dart';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {
  Size screenSize;
  double tileSize;

  //Back
  Back backgound;

  //Buttons
  List<ControllerButton> buttons;

  //Omar
  Omar omar;
  double omarX;
  double omarY;
  int spriteIndex;
  String orientation;
  bool isWalking;

  BoxGame() {
    initialize();
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
    spriteIndex = 0;
    orientation = "right";
    isWalking = false;
    omar = Omar(this, omarX, omarY, spriteIndex, orientation, isWalking);
  }

  void initialize() async {
    buttons = List<ControllerButton>();
    resize(await Flame.util.initialDimensions());

    backgound = Back(this, 0, 0);
    loadButtons();
    loadOmar();
  }

  void render(Canvas canvas) {
    backgound.render(canvas);
    omar.render(canvas);
    buttons.forEach((ControllerButton button) => button.render(canvas));
  }

  void update(double t) {
    omar = Omar(this, omarX, omarY, spriteIndex, orientation, isWalking);
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