import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {

	static final String endPoint = '/api/v1/auth_user';

	// Keys to store and fetch data from SharedPreferences
	static final String authTokenKey = 'auth_token';
	static final String userIdKey = 'user_id';
	static final String nameKey = 'name';
	static final String roleKey = 'role';

	static String getToken(SharedPreferences prefs) {
		return prefs.getString(authTokenKey);
	}

	static insertDetails(SharedPreferences prefs, var response) {
		prefs.setString(authTokenKey, response['auth_token']);
		var user = response['user'];
		prefs.setInt(userIdKey, user['id']);
		prefs.setString(nameKey, user['name']);
	}
	
}