/**a
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import '../presenters/navigationPresenter.dart';
import 'colorPalette.dart';
import '../presenters/settingsPresenter.dart';


class UIFunctions
{
	static final DIVIDER = 100;
	static final NAV_NAMES_LIST = [ "home", "statistics", "camera", "database", "settings" ];
	static final NAV_ICON_LIST = [ Icons.house, Icons.bar_chart, Icons.camera, Icons.data_object, Icons.settings ];


	/**
         *
	 **/
	static double calculateWidthByFactor(BuildContext context, double factor)
	{
		return MediaQuery.of(context).size.width / DIVIDER * factor;
	}

	
	/**
	 *
	 **/
	static double calculateHeightByFactor(BuildContext context, double factor)
	{
		return MediaQuery.of(context).size.height / DIVIDER * factor;
	}

	
	/**
 	 *
	 **/
	static List<Widget> addTopBar(BuildContext context, String title)
	{
		List<Widget> bar = [];
			
		bar.add(Container(
			width: calculateWidthByFactor(context, 50),
			alignment: Alignment.bottomLeft,
			padding: EdgeInsets.fromLTRB(20.0, 00.0, 00.0, 00.0),
			child: Text(
				title,
				style: TextStyle(
					fontSize: 25.0,
					color: SettingsPresenter.getDarkLightMode ? ColorPallette.getFontColorDark : ColorPallette.getFontColorLight,
				),
			),
		));
		bar.add(Container(
			width: calculateWidthByFactor(context, 50),
			alignment: Alignment.bottomRight,
			padding: EdgeInsets.fromLTRB(00.0, 00.0, 20.0, 00.0),
			child: Icon(
				Icons.grid_view,
				size: 45.0,
				color: SettingsPresenter.getDarkLightMode ? ColorPallette.getFontColorDark : ColorPallette.getFontColorLight,
			),
		));

		return bar;
	}


	/**
	 *
	 **/
	static List<Widget> addNavigationBar(BuildContext context, int size)
	{
		List<Widget> nav = [];
		NavigationPresenter navPresenter = new NavigationPresenter();

		for (int i = 0; i < size; i++) {
			nav.add(Container(
				width: calculateWidthByFactor(context, 100/size),
				alignment: Alignment.bottomCenter,
				child: MaterialButton(
					onPressed: () async => navPresenter.onPressed(context, NAV_NAMES_LIST[i]),
					child: Icon(
						NAV_ICON_LIST[i],
						size: 40.0,
						color: SettingsPresenter.getDarkLightMode ? ColorPallette.getFontColorDark : ColorPallette.getFontColorLight,
					),
				),
			));
		}

		return nav;
	}
}
