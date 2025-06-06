import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blocstructure/execeptions/app_exception.dart';
import 'package:blocstructure/network/base_api_services.dart';

import 'package:http/http.dart' as http;

class NetworkServiceApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetExecption('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(
    String url,
    data, {
    bool needHeader = false,
    Map<String, String>? headers,
  }) async {
    dynamic jsonResponse;

    print(url);
    print(data);

    var datacode = jsonEncode(data);

    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: datacode,
            headers: needHeader ? headers : null,
          )
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      // Optional: Debug log
      print("Status Code: ${response.statusCode}");
      print("Response: ${response.body}");
    } on SocketException {
      throw NoInternetExecption('No internet connection');
    } on TimeoutException {
      throw FetchDataException('Request timed out');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetExecption('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> putApi(String url, data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .put(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetExecption('');
    } on TimeoutException {
      throw FetchDataException('Time out try again');
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      // ignore: constant_pattern_never_matches_value_type
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      // ignore: constant_pattern_never_matches_value_type
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      // ignore: constant_pattern_never_matches_value_type
      case 401:
        throw UnauthorisedException();

      // ignore: constant_pattern_never_matches_value_type
      case 500:
        throw FetchDataException(
          'Error communicating with server${response.statusCode}',
        );

      default:
        throw UnauthorisedException();
    }
  }
}
