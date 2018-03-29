class AuthUtils {
	
	static final Map DEVELOPMENT = {
		'host': '192.168.31.110:3000',
		'endpoint': '/api/v4/auth_user'
	};
	
	static final Map PRODUCTION = {
		'host': 'production.com',
		'endpoint': '/api/v4/auth_user'
	};
	
	// Keys to store and fetch data from SharedPreferences
	static final String AUTH_TOKEN = 'auth_token';
	static final String USER_ID = 'user_id';
	static final String NAME = 'name';
	static final String ROLE = 'role';
	
}