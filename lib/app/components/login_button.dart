import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  LoginButton({this.onPressed});
  
	@override
  Widget build(BuildContext context) {
		return new Container(
			margin: const EdgeInsets.symmetric(vertical: 12.0),
			child: new Material(
				elevation: 5.0,
				child: new MaterialButton(
					color: Theme.of(context).primaryColor,
					height: 42.0,
					child: new Text(
						'Log In',
						style: new TextStyle(
							color: Colors.white
						)
					),
					onPressed: onPressed
				)
			)
		);
  }
	
}