/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import 'dart:async';


class NavigationPresenter
{
	/**
  	 * Constructor
	 **/
	NavigationPresenter()
	{
	}


	/**
 	 * Method to check which button is pressed and activate an
	 * action
	 **/
	Future<VoidCallback?> onPressed(BuildContext context, String button) async 
	{
		String pathId = "";
		
		if (button == "") {
			// Hier moet ik nog wat op verzinnen aangezien de functie async is
		}

		if (ModalRoute.of(context)?.settings.name != null) {
			String? p = ModalRoute.of(context)?.settings.name!!;
			pathId = p!!;
			pathId = pathId.split("/")[1];
		}

		if (isActive(button, pathId) == false) {
			Navigator.pop(context);
			Navigator.pushNamedAndRemoveUntil(context, "/"+button, (Route<dynamic> route) => false);
		}	
	}

	
	/**
	 * Method to check if the button is active
	 **/
	bool isActive(String button, String viewId)
	{
		if (button == viewId || viewId == "") {
			return true;
		}

		return false;
	}
}
