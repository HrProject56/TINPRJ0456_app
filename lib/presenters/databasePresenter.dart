/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 14/10/2022
 */


import 'package:flutter/material.dart';
import '../models/settingsModel.dart';
import '../models/databaseModel.dart';


class DatabasePresenter
{
  late final _settingsModel;
  late DatabaseModel _databaseModel;


  /**
   * Constructor
   */
  DatabasePresenter()
  {
    _settingsModel = SettingsModel.getInstance();
    _databaseModel = DatabaseModel.getInstance();

    _settingsModel.setSavedDatabases = "henk";
  }


  /**
   * Method to check if there are any databases saved
   */
  bool checkIfdatabase()
  {
    return _settingsModel.getSavedDatabases.isNotEmpty;
  }


  void getDataFromDatabases()
  {
    if (!checkIfdatabase()) {
      return;
    }
  }
}