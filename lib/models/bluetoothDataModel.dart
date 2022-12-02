/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 14/11/2022
 */


import 'model.dart';


class BluetoothDataModel extends Model
{
  static BluetoothDataModel? _instance;

  List<List<int>> _data = [];


  /**
   * Get instance of the model
   */
  static BluetoothDataModel getInstance()
  {
    if (_instance == null) {
      _instance = BluetoothDataModel();
    }

    return _instance!;
  }


  /**
   * Setters
   */
  set setData(List<int> data) => _data.add(data);


  /**
   * Getters
   */
  List<List<int>> get getData => _data;
}