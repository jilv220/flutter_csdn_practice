import 'dart:io';
import 'package:dio/dio.dart';

class NetRequest {

  Map<String,dynamic> _json;
  static BaseOptions _options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: ContentType.json,
  );
  static Dio _dio;

  static get (String url,{options, Function onSuccess, Function onFailure}) async {
    Dio dio = buildDio();
    try {
      Response response = await dio.get(url, options: options);

      onSuccess(response.data);
    } catch (exception) {

      onFailure(exception);
    }
  }

  static post (String url, Map<String,String> prams,{options, Function onSuccess, Function onFailure}) async {
    Dio dio = buildDio();
    try {
      Response response = await dio.post(url, data: prams,options: options);
      onSuccess(response.data);
    } catch (exception) {

      onFailure(exception);
    }
  }

 static Dio buildDio() {
    if (_dio == null) {
      _dio = new Dio(_options);
    }
    return _dio;
 }

  Map<String,dynamic> getJson() {
    return _json;
  }
}