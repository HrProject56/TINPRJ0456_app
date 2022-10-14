/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 14/10/2022
 */


import 'package:flutter/material.dart';


class ColorPallette
{
    static final _DEFAULT_OPACITY = 01.0;
    static final _backgroundLightColor = Color.fromRGBO(255, 255, 255, _DEFAULT_OPACITY);
    static final _backgroundDarkColor = Color.fromRGBO(42, 42, 42, _DEFAULT_OPACITY);
    static final _fontColorLight = Color.fromRGBO(00, 00, 00, _DEFAULT_OPACITY);
    static final _fontColorDark = Color.fromRGBO(255, 255, 255, _DEFAULT_OPACITY);


  /**
   * Getters
   */
  static Color get getBackgroundDarkColor => _backgroundDarkColor;
  static Color get getBackgroundLightColor => _backgroundLightColor;
  static Color get getFontColorLight => _fontColorLight;
  static Color get getFontColorDark => _fontColorDark;
}
