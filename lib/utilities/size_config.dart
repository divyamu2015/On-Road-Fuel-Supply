import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static double screenwidth = 0;
  static double screenheight = 0;
  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;
  static double sizeMultiplier = 0;

  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
    } else {
      _screenHeight = constraints.maxWidth;
      _screenWidth = constraints.maxHeight;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth =
    // _screenWidth > 600 ? _screenWidth / 170 :
    _screenWidth / 100;
    _blockHeight =
    // _screenWidth > 600 ? _screenHeight / 170 :
    _screenHeight / 100;
    screenwidth = _screenWidth;
    screenheight = _screenHeight;
    textMultiplier = isTablet()
        ? ((_blockHeight / _blockWidth) * (_blockHeight / _blockWidth) * 7)
        .clamp(5, 6)
        : ((_blockHeight / _blockWidth) * (_blockHeight / _blockWidth))
        .clamp(4, 5);

    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
    sizeMultiplier =
    isTablet() ? _blockWidth.clamp(3.5, 4.5) : _blockWidth.clamp(3, 4);
  }

  static bool isTablet() {
    return screenheight >= 900 && screenwidth >= 600;
  }
}
