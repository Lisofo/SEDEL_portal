import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:portal_maqueta/config/config.dart';
import 'package:portal_maqueta/providers/menu_providers.dart';
import 'package:provider/provider.dart';

class LoginServices {
  int? statusCode;
  String apiUrl = Config.APIURL;
  late String apiLink = apiUrl + 'api/auth/login';

  Future<void> login(String login, password, BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"login": login, "password": password});
    var dio = Dio();
    String link = apiLink;
    try {
      var response = await dio.request(
        link,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      statusCode = response.statusCode;

      if (statusCode == 200) {
        print(response.data['token']);
        Provider.of<MenuProvider>(context, listen: false).setToken(response.data['token']);
        Provider.of<MenuProvider>(context, listen: false).setUId(response.data['uid'].toString());
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<int?> getStatusCode() async {
    return statusCode;
  }
}
