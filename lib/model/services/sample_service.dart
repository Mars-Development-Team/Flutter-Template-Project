import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/constants/endpoint_constants.dart';
import '../apis/app_exception.dart';
import 'base_service.dart';

class SampleService extends BaseService {
  BaseOptions? option;
  Dio? dio;

  SampleService.init() {
    option = BaseOptions(
      baseUrl: Endpoint.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: Headers.jsonContentType,
    );
    dio = Dio(option);
  }

  @override
  Future fetchRequest(String path, Options? options) async {
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
  Future postRequest(String path, dynamic model) async {
    dynamic responseJson;
    final dio = Dio(option);
    try {
      var response = await dio.post(
        Endpoint.SAMPLE_PATH,
        data: model.toJson(),
      );
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
