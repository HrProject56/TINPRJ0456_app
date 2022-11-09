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
import 'dart:convert';


class BluetoothPresenter
{
  late List<BluetoothDevice>                    _cdevices;              /// Connected devices
  late StreamController<List<BluetoothDevice>>  _connectedDevices;
  late StreamController<List<BluetoothDevice>>  _sdevices;              /// Search devices
  late List<BluetoothDevice>                    _searchDevices;
  late bool                                     _connected;             /// State if connecteds
  final int                                     _timeout = 60;
  late FlutterBlue                              _flutterBlue;


  /**
   * Constructor
   */
  BluetoothPresenter()
  {
    _cdevices = [];
    _connectedDevices = StreamController<List<BluetoothDevice>>.broadcast();
    _sdevices = StreamController<List<BluetoothDevice>>.broadcast();
    _searchDevices = [];
    _connected = false;
    _flutterBlue = FlutterBlue.instance;

    FlutterBlue.instance.state.listen((state) {
      if (state == BluetoothState.off) {
        /// TODO: Alert user
        print("[info]\tZet uw bluetooth eerst aan!");
      } else if (state == BluetoothState.on) {
        try {
          print("[info]\tGefeliciteerd uw bluetooth staat aan!");
        } on PlatformException {
          /// TODO: Error system
        }
      }
    });

    scanForDevices();
  }


  /**
   * Method to scan the area for devices
   */
  void scanForDevices() async
  {
    /// Make sure devices list is empty
    _sdevices.stream.drain();
    List<String> b_ids = [];
    _searchDevices.clear();

    try {
      _flutterBlue.startScan(timeout: Duration(seconds: _timeout), scanMode: ScanMode.balanced, allowDuplicates: false);

      StreamSubscription<List<ScanResult>> stream = _flutterBlue.scanResults.listen((results) {
        for (ScanResult s in results) {
          if (s.device.name.length > 0 && !b_ids.contains(s.device.id.id)) {
            b_ids.add(s.device.id.id);
            _searchDevices.add(s.device);
            _sdevices.sink.add(_searchDevices);
            // print('[info]\tDevice: ${s.device.id.id} with name ${s.device.name} and length: ${s.device.name.length} with RSSI: ${s.rssi} found!!\n');

            // if (s.device.id.id == "08:3A:F2:31:9B:68") {
            //   print("address: found!");
            // }
          }
        }
      });
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
   * Method to make a connection with a bluetooth device
   */
  void connectToDevice(BluetoothDevice device) async
  {
    try {
      await device.connect(timeout: Duration(seconds: 10), autoConnect: false);
      print('[info]\tSuccesvol gekoppeld aan apparaat: ${device.name}\n');
    } on PlatformException {

    }

    _cdevices.add(device);
    _connectedDevices.sink.add(_cdevices);
    _searchDevices.remove(device);

    var asciiDecoder = AsciiDecoder();

    List<BluetoothService> services = await device.discoverServices();
    services.forEach((x) {
        x.characteristics.forEach((y) {
          y.descriptors.forEach((z) async {
            List<int> value = await z.read();
            print('[info]\tData: ${value}');
            //print('[info]\tData: ${asciiDecoder.convert(value)}');
          });
        });
    });
  }


  /**
   *
   */
  void disconnectDevice(BluetoothDevice device)
  {
    try {
      device.disconnect();
    } on PlatformException {

    }

    _cdevices.remove(device);
    _connectedDevices.sink.add(_cdevices);
  }


  /**
   *
   */
  Widget addWidgetToList(BluetoothDevice device, bool conn)
  {
    return Container(
      height: 60.00,
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
      child: Row(
        children: <Widget>[
          Container(
            width: 250.0,
            child: Text(
              device.name,
              style: TextStyle(
                fontSize: 20.00,
                color: UIFunctions.toggleFontColor(),
              ),
            ),
          ),
          Container(
            width: 50.0,
            alignment: Alignment.center,
            child: MaterialButton(
              onPressed: () async {
                conn == false ? connectToDevice(device) : disconnectDevice(device);
              },
              child: Icon(
                conn == false ? Icons.add_circle_outline : Icons.remove_circle_outline,
                size: 25.0,
                color: UIFunctions.toggleFontColor(),
              ),
            ),
          ),
        ],
      ),
    );
  }


  ///
  /// Getters
  ///
  StreamController<List<BluetoothDevice>> getSearchList()
  {
    return _sdevices;
  }


  StreamController<List<BluetoothDevice>> getConnectedList()
  {
    return _connectedDevices;
  }
}