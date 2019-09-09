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
    'heart.png',
    'launcher/game_icon.png',
    'messages/message_00.png',
    'messages/message_01.png',
    'messages/message_02.png',
    'messages/message_03.png',
    'messages/message_04.png',
    'messages/message_05.png',
    'messages/message_06.png',
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
    'eloir_walking_left/tile000.png',
    'eloir_walking_left/tile001.png',
    'eloir_walking_left/tile002.png',
    'eloir_walking_left/tile003.png',
    'eloir_walking_left/tile004.png',
    'eloir_walking_left/tile005.png',
    'eloir_walking_left/tile006.png',
    'eloir_walking_left/tile007.png',
    'eloir_walking_bottom/tile000.png',
    'eloir_walking_bottom/tile001.png',
    'eloir_walking_bottom/tile002.png',
    'eloir_walking_bottom/tile003.png',
    'eloir_walking_bottom/tile004.png',
    'eloir_walking_bottom/tile005.png',
    'eloir_walking_bottom/tile006.png',
    'eloir_walking_bottom/tile007.png',
  ]);

  BoxGame game = BoxGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  tapper.onTapUp = game.onTapUp;
  flameUtil.addGestureRecognizer(tapper);
}
