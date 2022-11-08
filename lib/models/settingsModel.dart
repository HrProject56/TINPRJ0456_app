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
  static SettingsModel? _instance;

  bool _darkLightValue = false;
  String _currentLanguage = "English";
  List<String> _savedDatabases = [];
  String _appVersion = "";


  /**
   * Construct instance
   */
  static SettingsModel getInstance()
  {
    if (_instance == null) {
      _instance = SettingsModel();
    }

    return _instance!!;
  }


  /**
   * Setters
   */
  set setDarkLightMode(bool value) => _darkLightValue = value;
  set setCurrentLanguage(String lang) => _currentLanguage = lang;
  set setSavedDatabases(String url) => _savedDatabases.add(url);
  set setAppVersion(String version) => _appVersion = version;


  /**
   * Getters
   */
  bool get getDarkLightMode => _darkLightValue;
  String get getCurrentLanguage => _currentLanguage;
  List<String> get getSavedDatabases => _savedDatabases;
  String get getAppVersion => _appVersion;
}