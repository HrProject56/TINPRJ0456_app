/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../utils/uiFunctions.dart';
import '../presenters/bluetoothPresenter.dart';


class BluetoothView extends StatefulWidget
{
	static const ROUTE_ID = 'bluetoothview';

	@override
	_BluetoothView createState() => _BluetoothView();
}


class _BluetoothView extends State<BluetoothView>
{
	final title = 'Bluetooth devices';
	BluetoothPresenter bluetoothPresenter = BluetoothPresenter();
	
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
								child: Column(
									children: <Widget>[
										// Content of the connected devices
										Container(
											alignment: Alignment.bottomLeft,
											child: Text(
												"Gekoppelde apparaten!",
												style: TextStyle(
													fontSize: 12.00,
													color: UIFunctions.toggleFontColor(),
												),
											),
										),
										Container(
											height: UIFunctions.calculateHeightByFactor(context, 23.0),
											child: StreamBuilder<List<BluetoothDevice>> (
												stream: bluetoothPresenter.getConnectedList().stream,
												builder: (context, stream) {
													if (stream.hasData) {
														List<BluetoothDevice> l = stream.data!;
														return ListView.builder (
																itemCount: l.length,
																scrollDirection: Axis.vertical,
																shrinkWrap: true,
																itemBuilder: (BuildContext context, int index) {
																	return bluetoothPresenter.addWidgetToList(l[index], true);
																});
													} else {
														return Container();
													}
												},
											),
										),

										// Content of the searched devices
										Container(
											alignment: Alignment.bottomLeft,
											child: Text(
													"Gevonden apparaten!",
													style: TextStyle(
														fontSize: 12.00,
														color: UIFunctions.toggleFontColor(),
													),
											),
										),
										Container(
											height: UIFunctions.calculateHeightByFactor(context, 33.0),
											child: StreamBuilder<List<BluetoothDevice>> (
												stream: bluetoothPresenter.getSearchList().stream,
												builder: (context, stream) {
													if (stream.hasData) {
														List<BluetoothDevice> l = stream.data!;
														return ListView.builder (
																itemCount: l.length,
																scrollDirection: Axis.vertical,
																shrinkWrap: true,
																itemBuilder: (BuildContext context, int index) {
																	return bluetoothPresenter.addWidgetToList(l[index], false);
																});
													} else {
														return Container();
													}
												},
											),
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
