/**
 * @author Nico van Ommen
 * @brief
 *
 * @version 1.0.0
 * @date 11/10/2022
 **/


import 'package:flutter/material.dart';


class HomeView extends StatefulWidget
{
	static const ROUTE_ID = 'homeview';

	@override
	_HomeView createState() => _HomeView();
}


class _HomeView extends State<HomeView>
{
	final title = 'Dashboard';
	

	@override
	void dispose()
	{
		super.dispose();
	}


	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
			
		);
	}	
}
