import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'auth_utils.dart';

class NetworkUtils {
	static final String host = developmentHost;
	static final String productionHost = 'https://www.yoursite.com';
	static final String developmentHost = 'http://192.168.31.110:3000';

	static dynamic authenticateUser(String email, String password) async {
		var uri = host + AuthUtils.endPoint;

		try {
			final response = await http.post(uri, body: {
				'email': email,
				'password': password,
				'authenticate': 'user'
			});

			final responseJson = json.decode(response.body);
			return responseJson;

		} catch (exception) {
			print(exception);
			if(exception.toString().contains('SocketException')) {
				return 'NetworkError';
			} else {
				return null;
			}
		}
	}

	static logoutUser(BuildContext context, SharedPreferences prefs) {
		prefs.setString(AuthUtils.authTokenKey, null);
		prefs.setInt(AuthUtils.userIdKey, null);
		prefs.setString(AuthUtils.nameKey, null);
		prefs.setString(AuthUtils.roleKey, null);
		Navigator.of(context).pushReplacementNamed('/');
	}

	static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
		scaffoldKey.currentState.showSnackBar(
			new SnackBar(
				content: new Text(message ?? 'You are offline'),
			)
		);
	}
}