/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import 'package:scanner_app/utils/colorPalette.dart';
import '../utils/uiFunctions.dart';
import '../utils/colorPalette.dart';
import '../presenters/settingsPresenter.dart';


class SettingsView extends StatefulWidget
{
	static const ROUTE_ID = 'settingsview';

	@override
	_SettingsView createState() => _SettingsView();
}


class _SettingsView extends State<SettingsView>
{
	final title = 'Settings';
	final listHeightFactor = 9.0;
	final fontSize = 20.0;
	bool darkLightMode = false;

	SettingsPresenter settingsPresenter = SettingsPresenter();

	
	/**
	 * Method to refresh the widget by disposing its old content
	 **/
	@override
	void dispose()
	{
		super.dispose();
	}


	/**
 	 * Method to build a new widget by returning the method build with
	 * a build context module
	 **/
	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
			appBar: null,
			backgroundColor: UIFunctions.toggleBackground(),
			body: Center(
				child: Container(
					height: double.maxFinite,
					child: Column(
						children: <Widget>[
							// Title Container
							UIFunctions.addTopBar(context, title),

							
							// Contents Container
							Container(
								width: MediaQuery.of(context).size.width,
								height: UIFunctions.calculateHeightByFactor(context, 70),
								padding: EdgeInsets.fromLTRB(30.0, 00.00, 30.00, 00.0),
								decoration: BoxDecoration(
									border: Border(
										top: BorderSide(
											width: 1.0,
											color: UIFunctions.toggleFontColor(),
											style: BorderStyle.solid,
										),
									),
								),
								child:	ListView(
											children: <Widget>[
												Row(
													children: <Widget>[
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 50),
															height: UIFunctions.calculateHeightByFactor(context, 7),
															alignment: Alignment.centerLeft,
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
																	"Scanner koppelen",
																	style: TextStyle(
																		fontSize: fontSize,
																		color: UIFunctions.toggleFontColor(),
																	),
															),
														),
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 30),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
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
															child: MaterialButton(
																onPressed: () async => settingsPresenter.onPressedNavigation(context, "bluetooth"),
																child: Icon(
																	Icons.chevron_right,
																	size: 35.0,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
													],
												),
												Row(
													children: <Widget>[
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 50),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
															alignment: Alignment.centerLeft,
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
																	"Database toevoegen",
																	style: TextStyle(
																		fontSize: fontSize,
																		color: UIFunctions.toggleFontColor(),
																	),
															),
														),
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 30),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
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
															child: MaterialButton(
																onPressed: () async => settingsPresenter.onPressedNavigation(context, "database"),
																child: Icon(
																	Icons.chevron_right,
																	size: 35.0,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
													],
												),
												Row(
													children: <Widget>[
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 50),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
															alignment: Alignment.centerLeft,
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
																	"Geschiedenis bekijken",
																	style: TextStyle(
																		fontSize: fontSize,
																		color: UIFunctions.toggleFontColor(),
																	),
															),
														),
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 30),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
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
															child: MaterialButton(
																onPressed: () async => settingsPresenter.onPressedNavigation(context, "history"),
																child: Icon(
																	Icons.chevron_right,
																	size: 35.0,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
													],
												),
												Row(
													children: <Widget>[
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 50),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
															alignment: Alignment.centerLeft,
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
																settingsPresenter.getDarkLightMode ? "Dark Mode" : "Light Mode",
																style: TextStyle(
																	fontSize: fontSize,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 30),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
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
															child: Switch(
																value: settingsPresenter.getDarkLightMode,
																onChanged: (onchange) async {
																	setState(() {
																	  settingsPresenter.onSwitchedDLMode(context, onchange);
																	});
																},
															),
														),
													],
												),
												Row(
													children: <Widget>[
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 50),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
															alignment: Alignment.centerLeft,
															decoration: BoxDecoration(
																border: Border(
																	top: BorderSide(
																		width: 1.0,
																		color: UIFunctions.toggleFontColor(),
																		style: BorderStyle.solid,
																	),
																),
															),
															child: Text("Taal",
																style: TextStyle(
																	fontSize: fontSize,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 30),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
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
														),
													],
												),
												Row(
													children: <Widget>[
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 50),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
															alignment: Alignment.centerLeft,
															decoration: BoxDecoration(
																border: Border(
																	top: BorderSide(
																		width: 1.0,
																		color: UIFunctions.toggleFontColor(),
																		style: BorderStyle.solid,
																	),
																),
															),
															child: Text("Updates",
																style: TextStyle(
																	fontSize: fontSize,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 30),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
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
															child: MaterialButton(
																onPressed: () async {},
																child: Icon(
																	Icons.file_download,
																	size: 35.0,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
													],
												),
												Row(
													children: <Widget>[
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 50),
															height: UIFunctions.calculateHeightByFactor(context, listHeightFactor),
															alignment: Alignment.centerLeft,
															decoration: BoxDecoration(
																border: Border(
																	top: BorderSide(
																		width: 1.0,
																		color: UIFunctions.toggleFontColor(),
																		style: BorderStyle.solid,
																	),
																),
															),
															child: Text("Versie",
																style: TextStyle(
																	fontSize: fontSize,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
														Container(
															width: UIFunctions.calculateWidthByFactor(context, 30),
															height: UIFunctions.calculateHeightByFactor(context, 7),
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
																settingsPresenter.getAppVersion(),
																style: TextStyle(
																	fontSize: 15.0,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
													],
												),
									],
								),
							),							


							// Navigation and footer container
							UIFunctions.addNavigationBar(context, 5),
						],	
					),	
				),	
			),
		);
	}	
}
