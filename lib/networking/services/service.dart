import 'dart:io';

import 'package:dio/dio.dart';
import '../model/app_exception.dart';
import 'base_service.dart';

class Service extends BaseService {
  BaseOptions? option;
  Dio? dio;

  Service.init({required String baseUrl}) {
    option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: Headers.jsonContentType,
    );
    dio = Dio(option);
  }

  @override
  Future fetchRequest({required String path, Options? options}) async {
    dynamic responseJson;
    final dio = Dio(option);
    try {
      var response = await dio.get(path, options: options);
      responseJson = returnResponse(response);
    } on SocketException {
      throw ('NO INTERNET CONNECTION !');
    }
    return responseJson;
  }

  @override
  Future postRequest(
      {required String path, dynamic model, Options? options}) async {
    dynamic responseJson;
    final dio = Dio(option);
    try {
      var response = await dio.post(path, data: model, options: options);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
