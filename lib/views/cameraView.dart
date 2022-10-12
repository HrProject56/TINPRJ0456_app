/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import '../utils/uiFunctions.dart';


class CameraView extends StatefulWidget
{
	static const ROUTE_ID = 'cameraview';

	@override
	_CameraView createState() => _CameraView();
}


class _CameraView extends State<CameraView>
{
	final title = 'Camera';

	
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
			body: Center(
				child: Container(
					height: double.maxFinite,
					child: Column(
						children: <Widget>[
							// Title Container
							Container(
								width: MediaQuery.of(context).size.width,
								height: UIFunctions.calculateHeightByFactor(context, 20),
								alignment: FractionalOffset.topCenter,
								margin: EdgeInsets.fromLTRB(00.0, 30.0, 00.00, 00.0),
								child: Row(
									children: UIFunctions.addTopBar(context, title),
								),
							),

							
							// Contents Container
							Container(
								width: MediaQuery.of(context).size.width,
								height: UIFunctions.calculateHeightByFactor(context, 65),
							),							


							// Navigation and footer container
							Container(
								width: MediaQuery.of(context).size.width,
								alignment: FractionalOffset.bottomCenter,
								child: Row(
									children: UIFunctions.addNavigationBar(context, 5),
								),
							),
						],	
					),	
				),	
			),
		);
	}	
}
