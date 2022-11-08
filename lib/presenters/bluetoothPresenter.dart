/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 14/10/2022
 */


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../utils/uiFunctions.dart';


class BluetoothPresenter
{
  late List<BluetoothDevice>  _cdevices;  /// Connected devices
  late List<BluetoothDevice>  _sdevices;  /// Search devices
  List<Widget>           _devices = [];   /// List with Widgets and device information
  late bool                   _connected; /// State if connecteds
  int                         _timeout = 120;
  late FlutterBlue            _flutterBlue;


  /**
   * Constructor
   */
  BluetoothPresenter()
  {
    _cdevices = [];
    _sdevices = [];
    _connected = false;
    _flutterBlue = FlutterBlue.instance;
    _devices = [];

    // FlutterBlue.instance.state.listen((state) {
    //   if (state == BluetoothState.off) {
    //     /// TODO: Alert user
    //     print("[info]\tZet uw bluetooth eerst aan!");
    //   } else if (state == BluetoothState.on) {
    //     try {
    //       print("[info]\tGefeliciteerd uw bluetooth staat aan!");
    //     } on PlatformException {
    //       /// TODO: Error system
    //     }
    //   }
    //
    //
    // });

    scanForDevices();
  }


  /**
   * Method to scan the area for devices
   */
  void scanForDevices() async
  {
    /// Make sure devices list is empty
    _devices.clear();
    List<String> b_ids = [];

    try {
      _flutterBlue.startScan(timeout: Duration(seconds: _timeout), scanMode: ScanMode.lowPower, allowDuplicates: false);

      StreamSubscription<List<ScanResult>> stream = _flutterBlue.scanResults.listen((results) {

        for (ScanResult s in results) {
          if (s.device.name.length > 0 && !b_ids.contains(s.device.id.id)) {
            b_ids.add(s.device.id.id);
            // _sdevices.add(s.device);
            // addWidgetToList(s.device);
            print('[info]\tDevice: ${s.device.id.id} with name ${s.device.name} and length: ${s.device.name.length} with RSSI: ${s.rssi} found!!\n');
            //print('[info]\tGrootte lijst: ${_sdevices.length}\n');

            if (s.device.id.id == "08:3A:F2:31:9B:68") {
              print("address: found!");
            }
          }
        }
      });

      // _flutterBlue.connectedDevices.then((value) => {
      //   for (BluetoothDevice b in value) {
      //     print('Device: ${b.id.id} with name: ${b.name}\n')
      //   }
      // });
    } on PlatformException {
      /// TODO: Build own error system
    }

    stopScanning();
  }


  /**
   * Method to stop scanning for devices
   */
  void stopScanning() async
  {
    _flutterBlue.stopScan();
  }


  /**
   *
   */
  void addWidgetToList(BluetoothDevice device)
  {
    _devices.add(Container(
      height: 30.00,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: UIFunctions.toggleFontColor(),
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Text(
        device.name,
        style: TextStyle(
          fontSize: 30.00,
          color: UIFunctions.toggleFontColor(),
        ),
      ),
    ));
  }


  ///
  /// Getters
  ///
  List<Widget> get getDevices => _devices;
}