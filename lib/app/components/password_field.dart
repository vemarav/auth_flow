import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool obscureText;
  final String passwordError;
  final VoidCallback togglePassword;
  PasswordField({
	  this.passwordController,
	  this.obscureText,
	  this.passwordError,
	  this.togglePassword
  });
  
	@override
  Widget build(BuildContext context) {
		return new Container(
			margin: const EdgeInsets.only(bottom: 16.0),
			child: new Theme(
				data: new ThemeData(
					primaryColor: Theme.of(context).primaryColor,
					textSelectionColor: Theme.of(context).primaryColor
				),
				child: new TextField(
					controller: passwordController,
					obscureText: obscureText,
					decoration: new InputDecoration(
						errorText: passwordError,
						contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
						labelText: 'Password',
						suffixIcon: new GestureDetector(
							onTap: togglePassword,
							child: new Icon(Icons.remove_red_eye),
						)
					)
				)
			)
		);
  }
	
}