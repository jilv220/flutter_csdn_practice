class CacheConfig {
	int maxAge;
	bool enable;
	int maxCount;

	CacheConfig({this.maxAge, this.enable, this.maxCount});

	CacheConfig.fromJson(Map<String, dynamic> json) {
		maxAge = json['maxAge'];
		enable = json['enable'];
		maxCount = json['maxCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['maxAge'] = this.maxAge;
		data['enable'] = this.enable;
		data['maxCount'] = this.maxCount;
		return data;
	}
}
