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
	static final _settingsPresenter = SettingsPresenter();


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
	 * Method to toggle light & dark mode background colors
	 */
	static Color toggleBackground()
	{
		return _settingsPresenter.getDarkLightMode ? ColorPallette.getBackgroundDarkColor : ColorPallette.getBackgroundLightColor;
	}


	/**
	 * Method to toggle light & dark font colors
	 */
	static Color toggleFontColor()
	{
		return _settingsPresenter.getDarkLightMode ? ColorPallette.getFontColorDark : ColorPallette.getFontColorLight;
	}

	
	/**
 	 *
	 **/
	static Widget addTopBar(BuildContext context, String title)
	{
		return 	Container(
			width: MediaQuery.of(context).size.width,
			height: UIFunctions.calculateHeightByFactor(context, 10),
			alignment: FractionalOffset.topCenter,
			margin: EdgeInsets.fromLTRB(00.0, 30.0, 00.00, 30.0),
			child: Row(
					children: <Widget>[
						Container(
							width: calculateWidthByFactor(context, 50),
							alignment: Alignment.bottomLeft,
							padding: EdgeInsets.fromLTRB(20.0, 00.0, 00.0, 00.0),
							child: Text(
								title,
								style: TextStyle(
									fontSize: 25.0,
									color: toggleFontColor(),
								),
							),
						),
						Container(
							width: calculateWidthByFactor(context, 50),
							alignment: Alignment.bottomRight,
							padding: EdgeInsets.fromLTRB(00.0, 00.0, 20.0, 00.0),
							child: Icon(
								Icons.grid_view,
								size: 45.0,
								color: toggleFontColor(),
							),
						),
					],
			),
		);
	}


	/**
	 *
	 **/
	static Widget addNavigationBar(BuildContext context, int size)
	{
		List<Widget> nav = [];
		NavigationPresenter navPresenter = NavigationPresenter();

		for (int i = 0; i < size; i++) {
			nav.add(Container(
				width: calculateWidthByFactor(context, 100/size),
				alignment: Alignment.bottomCenter,
				child: MaterialButton(
					onPressed: () async => navPresenter.onPressed(context, NAV_NAMES_LIST[i]),
					child: Icon(
						NAV_ICON_LIST[i],
						size: 40.0,
						color: toggleFontColor(),
					),
				),
			));
		}

		return Container(
			width: MediaQuery.of(context).size.width,
			alignment: FractionalOffset.bottomCenter,
			child: Row(
				children: nav,
			),
		);
	}
}
