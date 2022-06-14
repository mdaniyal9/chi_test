import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'general.dart';


typedef ApiPayload = Map<String, dynamic>;

class ApiClient {
  static ApiClient? _instance;

  String mBaseUrl;
  String mSiteCode;
  String? mAuthToken;

  ApiClient(this.mSiteCode, this.mBaseUrl);

  static ApiClient get instance => _instance!;

  static ApiClient create(siteCode) {
    String baseUrl = 'https://$siteCode.cognitivehealthintl.com';
    _instance = ApiClient(siteCode, baseUrl);

    return _instance!;
  }

  static void setAuthToken(authToken) {
    _instance?.mAuthToken = authToken;
  }

  static String getAuthToken() {
    return _instance!.mAuthToken!;
  }

  Future<ApiSingleResponse<T>> callObjectApi<T>(
      {required String endPoint,
      ApiPayload? req,
      required ModelFromJson fromJson,
      bool convertData = false}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (mAuthToken != null) {
      headers['Authorization'] = mAuthToken!;
    }

    String url = '$mBaseUrl/$endPoint';
    String payload = req == null ? '{}' : jsonEncode(req);

    debugPrint('Request: $req');
    debugPrint('URL: $url');

    final http.Response response;

    try {
      response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: payload,
      );
    } on SocketException catch (e) {
      return ApiSingleResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e.message,
        'ErrorCode': -1,
      });
    }

    return parseObjectResponse({
      'response': response.body,
      'code': response.statusCode,
      'fromJson': fromJson,
      'dataConvert': convertData
    });
  }

  Future<ApiListResponse<T>> callListApi<T>({
    required String endPoint,
    ApiPayload? req,
    required ModelFromJson fromJson,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (mAuthToken != null) {
      headers['Authorization'] = mAuthToken!;
    }

    String url = '$mBaseUrl/$endPoint';
    String payload = req == null ? '{}' : jsonEncode(req);

    debugPrint('Request: $req');
    debugPrint('URL: $url');
    final http.Response response;

    try {
      response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: payload,
      );
    } on SocketException catch (e) {
      return ApiListResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e.message,
        'ErrorCode': -1,
      });
    }

    return parseListResponse({
      'response': response.body,
      'code': response.statusCode,
      'fromJson': fromJson,
    });
  }
}

ApiListResponse<T> parseListResponse<T>(Map<String, dynamic> parameters) {
  final body = parameters['response'];
  final statusCode = parameters['code'];
  final fromJson = parameters['fromJson'];

  final Map<String, dynamic> parsed;

  debugPrint('BODY: $body');

  try {
    parsed = jsonDecode(body)?.cast<String, dynamic>();
  } on FormatException {
    return ApiListResponse(null, <String, dynamic>{
      'Status': 'Error',
      'ErrorMessage': body,
      'ErrorCode': statusCode,
    });
  }

  if (statusCode != 200) {
    return ApiListResponse(null, parsed);
  }

  return ApiListResponse<T>.fromMap(parsed, fromJson);
}

typedef ApiSingleResponse<T> Myfunc<T>(Map<String, dynamic> parameters);

ApiSingleResponse<T> parseObjectResponsex<T>(Myfunc fun, parameters) {
  return fun(parameters) as ApiSingleResponse<T>;
}

void writeToFile(data, fileName) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyPrintData = encoder.convert(data);
  debugPrint(prettyPrintData);
  // prettyPrintData = "hello is here";
  // String fileName = 'dataxx.json';
  File(fileName).writeAsStringSync(prettyPrintData);
}

ApiSingleResponse<T> parseObjectResponse<T>(Map<String, dynamic> parameters) {
  final body = parameters['response'];
  final statusCode = parameters['code'];
  final fromJson = parameters['fromJson'];

  Map<String, dynamic> parsed;
  try {
    debugPrint('BODY: $body');

    var bodyDict = jsonDecode(body);

    parsed = bodyDict;
  } on FormatException {
    return ApiSingleResponse(null, <String, dynamic>{
      'Status': 'Error',
      'ErrorMessage': body,
      'ErrorCode': statusCode,
    });
  }

  if (statusCode != 200) {
    return ApiSingleResponse(null, parsed);
  }

  return ApiSingleResponse<T>.fromMap(parsed, fromJson);
}
