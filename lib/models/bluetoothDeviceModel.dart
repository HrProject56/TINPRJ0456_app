/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 09/11/2022
 */


import 'dart:async';

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

    return _instance!;
  }


  /**
   * Setters
   */
  set setDevice(BluetoothDevice device) => _device = device;
  set setServices(List<BluetoothService> services) => _services = services;
  set setCharacteristics(List<BluetoothCharacteristic> characteristics) => _characteristics = characteristics;
  set setDescriptors(List<BluetoothDescriptor> descriptors) => _descriptors = descriptors;


  /**
   * Getters
   */
  BluetoothDevice? get getDevice => _device;
  List<BluetoothService> get getServices => _services;
  List<BluetoothCharacteristic> get getCharacteristics => _characteristics;
  List<BluetoothDescriptor> get getDescriptors => _descriptors;
}