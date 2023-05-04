import "dart:async";
import "dart:convert";
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_mobile_app/utils/app_exceptions.dart';
import 'package:movies_mobile_app/utils/constants.dart';
import 'package:movies_mobile_app/utils/network_info.dart';

class APICaller {
  final NetworkInfo _networkInfo = NetworkInfoImpl(InternetConnectionChecker());

  String url = Constants.baseUrl;

  setUrl(String uri) {
    url = Constants.baseUrl + uri;
  }

  Future<dynamic> getData(
      {Map<String, String>? headers, bool needAuthorization = false}) async {
    if (await _networkInfo.isConnected) {
      headers ??= {};
      headers["Accept"] = "application/json";
      try {
        final res = await http
            .get(Uri.parse(url), headers: headers)
            .timeout(const Duration(seconds: 50), onTimeout: () {
          throw RequestTimeOutException(
              "Poor internet or no internet connectivity");
        });
        var dataRes = _returnResponse(res);
        try {} catch (e) {
          debugPrint("Response parse error");
          debugPrint(e.toString());
        }
        return dataRes;
      } on SocketException {
        return const SocketException('');
      }
    } else {
      throw 'No Internet Connection!';
    }
  }

  _returnResponse(http.Response response) {
    debugPrint(
        "response.statusCode.toString() ${response.statusCode.toString()}");
    debugPrint("response.body ${response.body}");
    debugPrint("response.request.toString() ${response.request.toString()}");
    switch (response.statusCode) {
      case 201:
        final responseBody = json.decode(response.body);
        return responseBody;
      case 200:
        final responseBody = json.decode(response.body);
        return responseBody;
      case 204:
        return [];
      case 400:
        final responseBody = json.decode(response.body);
        return responseBody;
      case 401:
        final responseBody = json.decode(response.body);
        return responseBody;
      case 403:
        final responseBody = json.decode(response.body);
        return responseBody;
      case 404:
        final responseBody = json.decode(response.body);
        return responseBody;
    }
  }
}
