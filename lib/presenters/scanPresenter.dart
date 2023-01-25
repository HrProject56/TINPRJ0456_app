/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 09/12/2022
 */


import 'package:flutter/material.dart';
import '../models/bluetoothDataModel.dart';
import '../models/bluetoothDeviceModel.dart';
import '../presenters/databasePresenter.dart';
import '../utils/uiFunctions.dart';
import '../views/resultsView.dart';
import '../presenters/bluetoothPresenter.dart';
import 'dart:async';


class ScanPresenter
{
  late BluetoothDataModel bluetoothDataModel;
  late BluetoothDeviceModel _bluetoothDeviceModel;
  late BluetoothPresenter _bluetoothPresenter;
  bool _colorScanned = false;


  /**
   * Constructor
   */
  ScanPresenter()
  {
    bluetoothDataModel = BluetoothDataModel.getInstance();
    _bluetoothPresenter = BluetoothPresenter();
    _bluetoothDeviceModel = BluetoothDeviceModel.getInstance();

    print(_bluetoothDeviceModel.getDevice);
  }


  void startScan(BuildContext context)
  {
    _bluetoothPresenter.readFromDevice();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (bluetoothDataModel.getData.isEmpty) {
        print("[info]\tGeen kleur gescanned!");

        if (timer.tick == 30) {
          print("[info]\tTimer stopt met ticken!");
          timer.cancel();
        }
      } else {
        print("[info]\tKleur gescanned!");

        generateResults(context);
        Navigator.pushNamedAndRemoveUntil(context, "/results", (route) => false);

        timer.cancel();
      }
    });
  }


  void stopScan()
  {

  }


  /**
   *  Method to fill the list with the scan results
   */
  List<Widget> generateResults(BuildContext context)
  {
    List<Widget> results = [];
    int i;
    List<int> l = bluetoothDataModel.getData[bluetoothDataModel.getData.length-1];

    
    for (i = 0; i < 3; i++) {
      results.add(
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
          width: UIFunctions.calculateWidthByFactor(context, 40),
          height: UIFunctions.calculateHeightByFactor(context, 17),
          decoration: BoxDecoration(
              color: Color.fromRGBO(l[0], l[1], l[2], 1),
              // Red border with the width is equal to 5
              border: Border.all(
                  width: 2,
                  color: Color.fromRGBO(l[0]+10, l[1]+10, l[2]+10, 1),
              ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            "Color: " + l.toString(),
          ),
        )
      );
    }

    return results;
  }
}