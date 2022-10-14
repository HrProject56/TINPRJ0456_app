/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import '../utils/uiFunctions.dart';


class StatisticsView extends StatefulWidget
{
	static const ROUTE_ID = 'statisticsview';

	@override
	_StatisticsView createState() => _StatisticsView();
}


class _StatisticsView extends State<StatisticsView>
{
	final title = 'Statistics';

	
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
								height: UIFunctions.calculateHeightByFactor(context,  70),
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
