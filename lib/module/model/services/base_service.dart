import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;

import '../../../core/constants/endpoint_constants.dart';

abstract class BaseService {
  final String baseUrl = Endpoint.BASE_URL;

  Future<dynamic> fetchRequest(String path, Options? options);
  Future<dynamic> postRequest(String path, dynamic model);
  dynamic returnResponse(dio.Response response);
}
