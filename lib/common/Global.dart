
import 'dart:convert';
import 'package:flutter_app/configs/CacheConfig.dart';
import 'package:flutter_app/configs/profileConfig.dart';
import 'package:flutter_app/net/NetCache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static ProfileConfig profile = ProfileConfig();
  static NetCache netCache = NetCache();

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {

    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");

    if (_profile != null) {
      try {
        profile = ProfileConfig.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }

    profile.cache = profile.cache?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;


  }

  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));

}