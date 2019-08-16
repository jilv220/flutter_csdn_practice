import 'dart:convert';
import 'package:dio/dio.dart';

class NetRequest {

  Response _response;
  Map<String,dynamic> _json;

  void get (String url) async {
    var dio = new Dio();
    _response = await dio.get(url);
    _json = jsonDecode(_response.toString());
  }

  void post (String url, Map<String,String> prams) async {
    var dio = new Dio();
    _response = await dio.post(url,data: prams);
    _json = jsonDecode(_response.toString());
  }

  Response getResponse() {
    return _response;
  }

  Map<String,dynamic> getJson() {
    return _json;
  }
}