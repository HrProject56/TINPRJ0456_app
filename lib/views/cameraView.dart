/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../models/bluetoothDeviceModel.dart';
import '../utils/uiFunctions.dart';
import '../presenters/scanPresenter.dart';
import 'package:camera/camera.dart';


class CameraView extends StatefulWidget
{
	static const ROUTE_ID = 'cameraview';

	@override
	_CameraView createState() => _CameraView();
}


class _CameraView extends State<CameraView>
{
	final title = 'Scannen';
	List<CameraDescription> c = [];
	bool _showCameraView = true;
	List<BluetoothDevice> bl = [];
	BluetoothDeviceModel d = BluetoothDeviceModel.getInstance();
	BluetoothDevice?	_dropdownValue;
	ScanPresenter _scanPresenter = ScanPresenter();

	
	/**
	 * Method to refresh the widget by disposing its old content
	 **/
	@override
	void dispose()
	{
		super.dispose();
	}

	@override
	void initState()
	{
		if (d.getDevice != null) {
			bl.add(d.getDevice!);
		}

		// c = await availableCameras();
	}


	/**
 	 * Method to build a new widget by returning the method build with
	 * a build context module
	 **/
	@override
	Widget build(BuildContext context)
	{
		print('[info]\tLengte cameras: ${c.length}');
		// CameraController controller = CameraController(c.first, ResolutionPreset.max);
		//controller.initialize().then((_) => {
		//	if (!mounted) {

		//	}
		//});

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
								height: UIFunctions.calculateHeightByFactor(context,  70.0),
								child: Column(
									children: <Widget>[
										// Camera Container
										_showCameraView == true ? Container(
											height: UIFunctions.calculateHeightByFactor(context, 50.0),
											// child: CameraPreview(controller),
											child: Text(
												"CameraView",
											),
										) : Container(
											height: UIFunctions.calculateHeightByFactor(context, 50.0),
											child: Column(
												children: <Widget>[
													Container(
														height: UIFunctions.calculateHeightByFactor(context, 10.0),
													),
													Container(
														height: UIFunctions.calculateHeightByFactor(context, 10.0),
														alignment: Alignment.center,
														child: Text(
															"Volg de instructies van de hardware\nscanner om een kleur te scannen",
															style: TextStyle(
																fontSize: 10.0,
																color: UIFunctions.toggleFontColor(),
															),
														),
													),
													Container(
														height: UIFunctions.calculateHeightByFactor(context, 20.0),
														child: MaterialButton(
															onPressed: () async => _scanPresenter.startScan(context),
															child: Icon(
																Icons.upload_outlined,
																size: 100.0,
																color: UIFunctions.toggleFontColor(),
															),
														),
													),
													Container(
														child: DropdownButton<BluetoothDevice>(
															dropdownColor: UIFunctions.toggleFontColor(),
															focusColor: UIFunctions.toggleFontColor(),
															value: _dropdownValue,
															onChanged: (BluetoothDevice? device) async {
																setState(() {
																  _dropdownValue = device;
																});
															},
															items: bl.map<DropdownMenuItem<BluetoothDevice>>((BluetoothDevice device) {
																return DropdownMenuItem<BluetoothDevice>(
																	value: device,
																	child: Text(device.name.toString()),
																);
															}).toList(),
														),
													),
												],
											),
										),

										// Buttons Container
										Container(
											height: UIFunctions.calculateHeightByFactor(context, 15.0),
											child: Row(
												children: [
													Container(
														width: UIFunctions.calculateWidthByFactor(context, 50.0),
														alignment: Alignment.bottomCenter,
														child: MaterialButton(
															onPressed: () async {
																setState(() {
																	_showCameraView = true;
																});
															},
															child: Text(
																"Camera",
																style: TextStyle(
																	fontSize: 15.0,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
													),
													Container(
														width: UIFunctions.calculateWidthByFactor(context, 50.0),
														alignment: Alignment.bottomCenter,
														child: MaterialButton(
															onPressed: () async {
																setState(() {
																  _showCameraView = false;
																});
															},
															child: Text(
																"Scanner",
																style: TextStyle(
																	fontSize: 15.0,
																	color: UIFunctions.toggleFontColor(),
																),
															),
														),
													),
												],
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
