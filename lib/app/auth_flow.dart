import 'package:flutter/material.dart';
import 'package:auth_flow/app/pages/login_page.dart';

class AuthFlow extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Flutter Demo',
			theme: new ThemeData(
				primaryColor: new Color(0xFF4cbefb),
				textSelectionColor: new Color(0xFF4cbefb)
			),
			home: new LoginPage()
		);
	}
}