/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 09/11/2022
 */


import 'model.dart';
import 'package:flutter_blue/flutter_blue.dart';


class BluetoothDeviceModel extends Model
{
  static BluetoothDeviceModel? _instance;

  BluetoothDevice? _device;
  List<BluetoothService> _services = [];
  List<BluetoothCharacteristic> _characteristics = [];
  List<BluetoothDescriptor> _descriptors = [];


  /**
   * Get instance of the model
   */
  static BluetoothDeviceModel getInstance()
  {
    if (_instance == null) {
      _instance = BluetoothDeviceModel();
    }

    return _instance!!;
  }


  /**
   * Setters
   */
  set setDevice(BluetoothDevice device) => _device;
  set setServices(List<BluetoothService> services) => _services;
  set setCharacteristics(List<BluetoothCharacteristic> characteristics) => _characteristics;
  set setDescriptors(List<BluetoothDescriptor> descriptors) => _descriptors;


  /**
   * Getters
   */
  BluetoothDevice get getDevice => _device!;
  List<BluetoothService> get getServices => _services;
  List<BluetoothCharacteristic> get getCharacteristics => _characteristics;
  List<BluetoothDescriptor> get getDescriptors => _descriptors;
}