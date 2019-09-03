import 'dart:ui';

import 'package:Sorpresa/components/button-bottom.dart';
import 'package:Sorpresa/components/button-center.dart';
import 'package:Sorpresa/components/button-left.dart';
import 'package:Sorpresa/components/button-right.dart';
import 'package:Sorpresa/components/button-top.dart';
import 'package:Sorpresa/components/controller-button.dart';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {
  Size screenSize;
  double tileSize;
  List<ControllerButton> buttons;

  BoxGame() {
    initialize();
  }

  void loadButtons() {
    buttons.add(ButtonLeft(this, 30, 230, 'left'));
    buttons.add(ButtonTop(this, 30 + tileSize, 230 - tileSize, 'top'));
    buttons.add(ButtonBottom(this, 30 + tileSize, 230 + tileSize, 'bottom'));
    buttons.add(ButtonRight(this, 30 + (tileSize * 2), 230, 'right'));
    buttons.add(ButtonCenter(this, 30 + tileSize, 230, 'center'));

    // buttons.add(ControllerButton(this, (tileSize * 13) - 30, 230, 'a'));
    // buttons.add(ControllerButton(this, (tileSize * 12) - 30, 230 - tileSize, 'x'));
    // buttons.add(ControllerButton(this, (tileSize * 12) - 30, 230 + tileSize, 'y'));
    // buttons.add(ControllerButton(this, (tileSize * 11) - 30, 230, 'b'));
  }

  void initialize() async {
    buttons = List<ControllerButton>();
    resize(await Flame.util.initialDimensions());

    loadButtons();
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);
    
    buttons.forEach((ControllerButton button) => button.render(canvas));
  }

  void update(double t) {
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
        button.onTap(true);
      }
    });
  }

  void onTapUp(TapUpDetails u) {
    buttons.forEach( (ControllerButton button) {
      if(button.buttonRect.contains(u.globalPosition)) {
        button.onTap(false);
      }
    });
  }
}