import 'package:dio/dio.dart';

class CacheObject {

  CacheObject (this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;

  Response response;
  int timeStamp;

  @override
  // ignore: hash_and_equals
  bool operator == (otherResponse) {
    return response.hashCode == otherResponse.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;

}