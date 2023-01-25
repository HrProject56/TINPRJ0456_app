/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import '../utils/uiFunctions.dart';
import '../presenters/scanPresenter.dart';


class ResultsView extends StatefulWidget
{
	static const ROUTE_ID = 'resultsview';

	@override
	_ResultsView createState() => _ResultsView();
}


class _ResultsView extends State<ResultsView>
{
	final title = 'Results';
	ScanPresenter scanPresenter = ScanPresenter();
	
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
								padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
								child: ListView(
									scrollDirection: Axis.vertical,
									children: scanPresenter.generateResults(context),
								),
							),
							Container(
								width: MediaQuery.of(context).size.width,
								height: UIFunctions.calculateHeightByFactor(context, 2),
								child: MaterialButton(
									onPressed: () async => scanPresenter.startScan(context),
									child: Text(
										title,
										style: TextStyle(
											fontSize: 15.0,
											color: UIFunctions.toggleFontColor(),
										),
									),
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
