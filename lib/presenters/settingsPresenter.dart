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


class SettingsPresenter
{
  final DEFAULT_VERSION = "1.0.0";


  /**
   * Constructor
   */
  SettingsPresenter()
  {
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
  }


  /**
   * Setters
   */
  static set setDarkLightMode(bool value) => SettingsModel.setDarkLightMode = value;
  static set setSystemlang(String lang) => SettingsModel.setCurrentLanguage = lang;


  /**
   * Getters
   */
  static bool get getDarkLightMode => SettingsModel.getDarkLightMode;
  static String get getSystemLang => SettingsModel.getCurrentLanguage;
}