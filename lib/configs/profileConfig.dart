import 'package:flutter_app/configs/CacheConfig.dart';

class ProfileConfig {
	String lastLogin;
	CacheConfig cache;
	String user;
	String token;

	ProfileConfig({this.lastLogin, this.cache, this.user, this.token});

	ProfileConfig.fromJson(Map<String, dynamic> json) {
		lastLogin = json['lastLogin'];
		cache = json['cache'];
		user = json['user'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lastLogin'] = this.lastLogin;
		data['cache'] = this.cache;
		data['user'] = this.user;
		data['token'] = this.token;
		return data;
	}
}
