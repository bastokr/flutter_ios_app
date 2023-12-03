import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

String apiUrl = "192.168.0.71:8024";

class ApiClient extends GetConnect {
  static const JsonDecoder decoder = JsonDecoder();
  Future<Map<String, dynamic>> fetchProducts() async {
    final response = await get(
        'https://iukj.cafe24.com/api/list_mybot/tipsWMS/MENU_MGT_S005_S100');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "");
    } else {
      return decoder.convert(response.bodyString!);
    }
  }
}

class MyApiClient {
  final http.Client httpClient;
  MyApiClient({required this.httpClient});
}

class NetworkHelper {
  String apiUrl = "iukj.cafe24.com";
  String imgUrl = "http://iukj.cafe24.com";
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(imgUrl + url));
    if (response.statusCode == 200) {
      //Resultado da requisição
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future<dynamic> getPostData(Map<String, dynamic> postData) async {
    var url = Uri.http(apiUrl, this.url);

    http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type':
            'application/json', //'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: jsonEncode(postData),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
