/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 14/10/2022
 */


import 'model.dart';


class SettingsModel extends Model
{
  static bool darkLightValue = false;
  static String currentLanguage = "English";


  /**
   * Setters
   */
  static set setDarkLightMode(bool value) => darkLightValue = value;
  static set setCurrentLanguage(String lang) => currentLanguage = lang;


  /**
   * Getters
   */
  static bool get getDarkLightMode => darkLightValue;
  static String get getCurrentLanguage => currentLanguage;
}