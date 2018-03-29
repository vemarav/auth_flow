import 'package:flutter/material.dart';
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
	
	bool _isError = false;
	bool _obscureText = true;
	TextEditingController _emailController, _passwordController;
	String _errorText, _emailError, _passwordError, _email, _password;
	
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			key: _scaffoldKey,
			body: _loginScreen()
		);
	}
	
	Widget _loginScreen() {
		_emailController = new TextEditingController(text: _email ?? '');
		_passwordController = new TextEditingController(text: _password ?? '');
		
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
					new LoginButton(onPressed: _submitForm)
				],
			),
		);
	}
	
	_submitForm() {
	
	}
	
	_togglePassword() {
		setState(() {
			_email = _emailController.text;
			_password = _passwordController.text;
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
	
}