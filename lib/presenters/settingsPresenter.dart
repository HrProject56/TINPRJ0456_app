/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 14/10/2022
 */


import 'package:flutter/material.dart';
import '../models/settingsModel.dart';
import 'dart:async';
import '../utils/colorFunctions.dart';


class SettingsPresenter
{
  final DEFAULT_VERSION = "1.0.0";
  late SettingsModel _settingsModel;


  /**
   * Constructor
   */
  SettingsPresenter()
  {
    _settingsModel = SettingsModel.getInstance();
  }


  /**
   * Method to navigate to section in the selected section
   */
  Future<VoidCallback?> onPressedNavigation(BuildContext context, String button) async
  {
    if (button == "" || button == null) {
      // TODO: Write an error logging system
    }

    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, "/"+button, (Route route) => false);
  }


  /**
   * Method to call the git server en try to pull new files in
   */
  Future<VoidCallback?> onPressedUpdate(BuildContext context) async
  {

  }


  Future<VoidCallback?> onSwitchedDLMode(BuildContext context, bool value) async
  {
    setDarkLightMode = value;
  }


  /**
   * Method to get the current app version
   */
  String getAppVersion()
  {
    return DEFAULT_VERSION;
  }


  /**
   *
   */
  void saveSettingsToFile()
  {

  }


  /**
   *
   */
  static void setSavedSettingsOnStartup()
  {
    print("[info]\t\tFiles loaded on startup!");
    print("[info]\t\tHSL: ${ColorFunctions.RGBtoHSL(153, 82, 83)}");
    print("[info]\t\tRGB: ${ColorFunctions.HSLtoRGB(359.154, 0.302, 0.460)}");

    List<double> l = ColorFunctions.RGBtoXYZ(153, 82, 83);
    print("[info]\t\tXYZ: ${ColorFunctions.RGBtoXYZ(153, 82, 83)}");
    print("[info]\t\tLAB: ${ColorFunctions.XYZtoLAB(l[0], l[1], l[2])}");
    print("[info]\t\tDelta E value: ${ColorFunctions.DeltaE(62.7, -42.8, 39.6, 80.1, 0.1, -80.9)}");
  }


  /**
   * Setters
   */
  set setDarkLightMode(bool value) => _settingsModel.setDarkLightMode = value;
  set setSystemLang(String lang) => _settingsModel.setCurrentLanguage = lang;


  /**
   * Getters
   */
  bool get getDarkLightMode => _settingsModel.getDarkLightMode;
  String get getSystemLang => _settingsModel.getCurrentLanguage;
}