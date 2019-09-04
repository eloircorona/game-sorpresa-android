import 'dart:ui';
import 'package:Sorpresa/box-game.dart';
import 'package:Sorpresa/components/controller-button.dart';
import 'package:flame/sprite.dart';

class ButtonX extends ControllerButton {
  ButtonX(BoxGame game, double x, double y, String buttonName) : super(game, x, y, buttonName) {
    buttonSprite = Sprite('x.png');
  }
}