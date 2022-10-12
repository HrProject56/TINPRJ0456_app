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

		if (ModalRoute.of(context)?.settings.name != null) {
			String? p = ModalRoute.of(context)?.settings.name!!;
			pathId = p!!;
			pathId = pathId.split("/")[1];
		}

		switch (button)
		{
			case "home":
				if (isActive(button, pathId) == false) {
					print("[route]\t\tRoute home werkt!!");
					print("De button naam: "+button);
				}

				break;
			case "statistics":
				if (isActive(button, pathId) == false) {
					print("[route]\t\tRoute Statistics werkt!!");	
					print(button);
				}

				break;
			case "camera":
				if (isActive(button, pathId) == false) {
					print("[route]\t\tRoute camera werkt!!");
					print(button);
				}

				break;
			case "database":
				if (isActive(button, pathId) == false) {

				}
	
				break;
			case "settings":
				if (isActive(button, pathId) == false) {

				}			

				break;
			default:
				break;
		}
	}

	
	/**
	 * Method to check if the button is active
	 **/
	bool isActive(String button, String viewId)
	{
		if (button == viewId) {
			return true;
		}

		return false;
	}
}
