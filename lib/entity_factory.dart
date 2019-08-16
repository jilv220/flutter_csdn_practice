import 'package:flutter_app/configs/CacheConfig.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CacheConfigEntity") {
      return CacheConfig.fromJson(json) as T;
    } else {
      return null;
    }
  }
}