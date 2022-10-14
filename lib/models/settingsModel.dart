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
  static bool _darkLightValue = false;
  static String _currentLanguage = "English";
  static List<String> _savedDatabases = [];


  /**
   * Setters
   */
  static set setDarkLightMode(bool value) => _darkLightValue = value;
  static set setCurrentLanguage(String lang) => _currentLanguage = lang;
  static set setSavedDatabases(String url) => _savedDatabases.add(url);


  /**
   * Getters
   */
  static bool get getDarkLightMode => _darkLightValue;
  static String get getCurrentLanguage => _currentLanguage;
  static List<String> get getSavedDatabases => _savedDatabases;
}