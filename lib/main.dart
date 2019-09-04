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
    'back.jpg',
    'left.png',
    'right.png',
    'top.png',
    'bottom.png',
    'center.png',
    'a.png',
    'b.png',
    'x.png',
    'y.png',
    'omar_walking_left/tile000.png',
    'omar_walking_left/tile001.png',
    'omar_walking_left/tile002.png',
    'omar_walking_left/tile003.png',
    'omar_walking_left/tile004.png',
    'omar_walking_left/tile005.png',
    'omar_walking_left/tile006.png',
    'omar_walking_left/tile007.png',
    'omar_walking_right/tile000.png',
    'omar_walking_right/tile001.png',
    'omar_walking_right/tile002.png',
    'omar_walking_right/tile003.png',
    'omar_walking_right/tile004.png',
    'omar_walking_right/tile005.png',
    'omar_walking_right/tile006.png',
    'omar_walking_right/tile007.png',
    'omar_walking_top/tile000.png',
    'omar_walking_top/tile001.png',
    'omar_walking_top/tile002.png',
    'omar_walking_top/tile003.png',
    'omar_walking_top/tile004.png',
    'omar_walking_top/tile005.png',
    'omar_walking_top/tile006.png',
    'omar_walking_top/tile007.png',
    'omar_walking_bottom/tile000.png',
    'omar_walking_bottom/tile001.png',
    'omar_walking_bottom/tile002.png',
    'omar_walking_bottom/tile003.png',
    'omar_walking_bottom/tile004.png',
    'omar_walking_bottom/tile005.png',
    'omar_walking_bottom/tile006.png',
    'omar_walking_bottom/tile007.png',
  ]);

  BoxGame game = BoxGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  tapper.onTapUp = game.onTapUp;
  flameUtil.addGestureRecognizer(tapper);
}
