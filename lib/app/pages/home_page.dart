import 'dart:async';
import 'package:auth_flow/app/utils/auth_utils.dart';
import 'package:auth_flow/app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
	static final String routeName = 'home';

	@override
	State<StatefulWidget> createState() {
		return new _HomePageState();
	}

}

class _HomePageState extends State<HomePage> {
	GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
	Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

	SharedPreferences _sharedPreferences;
	String _authToken;

	@override
	void initState() {
		super.initState();
		_fetchSessionAndNavigate();
	}

	_fetchSessionAndNavigate() async {
		_sharedPreferences = await _prefs;
		String authToken = AuthUtils.getToken(_sharedPreferences);
		setState(() {
			_authToken = authToken;
		});
		print(_authToken);
		if(_authToken == null) {
			_logout();
		}
	}

	_logout() {
		NetworkUtils.logoutUser(_scaffoldKey.currentContext, _sharedPreferences);
	}

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			key: _scaffoldKey,
			appBar: new AppBar(
				title: new Text('Home'),
			),
			body: new Container(
				child: new Center(
					child: new MaterialButton(
						color: Theme.of(context).primaryColor,
						child: new Text(
							'Logout',
							style: new TextStyle(
								color: Colors.white
							),
						),
						onPressed: _logout
					),
				)
			),
		);
	}

}