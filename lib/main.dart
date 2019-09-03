import 'package:Sorpresa/box-game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/util.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.landscapeRight);

  Flame.images.loadAll(<String>[
    'left.png',
    'right.png',
    'top.png',
    'bottom.png',
    'center.png',
    'a.png',
    'b.png',
    'x.png',
    'y.png'
  ]);

  BoxGame game = BoxGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  tapper.onTapUp = game.onTapUp;
  flameUtil.addGestureRecognizer(tapper);
}
