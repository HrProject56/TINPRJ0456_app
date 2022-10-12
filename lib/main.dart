/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import 'views/homeView.dart';
import 'views/bluetoothView.dart';
import 'views/cameraView.dart';
import 'views/databaseView.dart';
import 'views/historyView.dart';
import 'views/resultsView.dart';
import 'views/settingsView.dart';
import 'views/statisticsView.dart';


/**
 * Main function to run the program, holding the routing system of the app
 **/
void main() => runApp(MaterialApp(
	initialRoute: '/home',
	routes: {
		'/home': 	(context) => HomeView(),
		'/statistics': 	(context) => StatisticsView(),
		'/camera': 	(context) => CameraView(),
		'/database': 	(context) => DatabaseView(),
		'/settings': 	(context) => SettingsView(),
		'/results': 	(context) => ResultsView(),
		'/bluetooth': 	(context) => BluetoothView(),
		'/history': 	(context) => HistoryView(),
	},
));
