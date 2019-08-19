
class ProfileConfig {
	String lastLogin;
	String user;
	String token;

	ProfileConfig({this.lastLogin, this.user, this.token});

	ProfileConfig.fromJson(Map<String, dynamic> json) {
		lastLogin = json['lastLogin'];
		user = json['user'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lastLogin'] = this.lastLogin;
		data['user'] = this.user;
		data['token'] = this.token;
		return data;
	}
}
