/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import 'views/homeView.dart';


/**
 * Main function to run the program, holding the routing system of the app
 **/
void main() => runApp(MaterialApp(
	initialRoute: '/home',
	routes: {
		'/home': (context) => HomeView(),
	},
));
