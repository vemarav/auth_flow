import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
	final TextEditingController emailController;
	final String emailError;
  EmailField({this.emailController, this.emailError});
  
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
			    keyboardType: TextInputType.emailAddress,
			    controller: emailController,
			    decoration: new InputDecoration(
						contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
				    errorText: emailError,
				    labelText: 'Email',
			    )
		    )
	    )
    );
  }
	
}