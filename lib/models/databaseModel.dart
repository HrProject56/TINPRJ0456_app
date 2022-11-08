/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 16/10/2022
 */


import 'model.dart';


class DatabaseModel extends Model
{
  static DatabaseModel? _instance;


  /**
   * Get instance of the model
   */
  static DatabaseModel getInstance()
  {
    if (_instance == null) {
      _instance = DatabaseModel();
    }

    return _instance!!;
  }
}