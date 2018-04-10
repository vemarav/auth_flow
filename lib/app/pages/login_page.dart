import 'dart:async';

import 'package:auth_flow/app/pages/home_page.dart';
import 'package:auth_flow/app/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auth_flow/app/utils/network_utils.dart';
import 'package:auth_flow/app/validators/email_validator.dart';
import 'package:auth_flow/app/components/error_box.dart';
import 'package:auth_flow/app/components/email_field.dart';
import 'package:auth_flow/app/components/password_field.dart';
import 'package:auth_flow/app/components/login_button.dart';

class LoginPage extends StatefulWidget {

	@override
	LoginPageState createState() => new LoginPageState();

}

class LoginPageState extends State<LoginPage> {
	final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
	Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
	SharedPreferences _sharedPreferences;
	bool _isError = false;
	bool _obscureText = true;
	bool _isLoading = false;
	TextEditingController _emailController, _passwordController;
	String _errorText, _emailError, _passwordError;

	@override
	void initState() {
		super.initState();
		_fetchSessionAndNavigate();
		_emailController = new TextEditingController();
		_passwordController = new TextEditingController();
	}

	_fetchSessionAndNavigate() async {
		_sharedPreferences = await _prefs;
		String authToken = AuthUtils.getToken(_sharedPreferences);
		if(authToken != null) {
			Navigator.of(_scaffoldKey.currentContext)
				.pushReplacementNamed(HomePage.routeName);
		}
	}

	_authenticateUser() async {
		if(_valid()) {
			var responseJson = await NetworkUtils.authenticateUser(_emailController.text, _passwordController.text);
			if(responseJson == null) {
				NetworkUtils.showSnackBar(_scaffoldKey, 'Something went wrong!');
			} else if(responseJson == 'NetworkError') {
				NetworkUtils.showSnackBar(_scaffoldKey, null);
			} else {
				AuthUtils.insertDetails(_sharedPreferences, responseJson);
				/**
				 * Removes stack and start with the new page.
				 * In this case on press back on HomePage app will exit.
				 * **/
				Navigator.of(_scaffoldKey.currentContext)
					.pushReplacementNamed(HomePage.routeName);
			}
		} else {
			setState(() {
				_emailError;
				_passwordError;
			});
		}
	}

	_valid() {
		bool valid = true;

		if(_emailController.text.isEmpty) {
			valid = false;
			_emailError = "Email can't be blank!";
		} else if(!_emailController.text.contains(EmailValidator.regex)) {
			valid = false;
			_emailError = "Enter valid email!";
		}

		if(_passwordController.text.isEmpty) {
			valid = false;
			_passwordError = "Password can't be blank!";
		} else if(_passwordController.text.length < 7) {
			valid = false;
			_passwordError = "Password is invalid!";
		}

		return valid;
	}

	Widget _loginScreen() {
		return new Container(
			child: new ListView(
				padding: const EdgeInsets.only(
					top: 100.0,
					left: 16.0,
					right: 16.0
				),
				children: <Widget>[
					new ErrorBox(
						isError: _isError,
						errorText: _errorText
					),
					new EmailField(
						emailController: _emailController,
						emailError: _emailError
					),
					new PasswordField(
						passwordController: _passwordController,
						obscureText: _obscureText,
						passwordError: _passwordError,
						togglePassword: _togglePassword,
					),
					new LoginButton(onPressed: _authenticateUser)
				],
			),
		);
	}

	_togglePassword() {
		setState(() {
			_obscureText = !_obscureText;
		});
	}

	Widget _loadingScreen() {
		return new Container(
			margin: const EdgeInsets.only(top: 100.0),
			child: new Center(
				child: new Column(
					children: <Widget>[
						new CircularProgressIndicator(
							strokeWidth: 4.0
						),
						new Container(
							padding: const EdgeInsets.all(8.0),
							child: new Text(
								'Please Wait',
								style: new TextStyle(
									color: Colors.grey.shade500,
									fontSize: 16.0
								),
							),
						)
					],
				)
			)
		);
	}

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			key: _scaffoldKey,
			body: _isLoading ? _loadingScreen() : _loginScreen()
		);
	}

}