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
				    errorText: emailError,
				    contentPadding: const EdgeInsets.all(12.0),
				    hintText: 'Email',
				    border: new OutlineInputBorder(
					    borderRadius: new BorderRadius.circular(32.0)
				    )
			    )
		    )
	    )
    );
  }
	
}