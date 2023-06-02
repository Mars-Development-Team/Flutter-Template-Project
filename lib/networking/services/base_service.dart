import 'package:dio/dio.dart';

abstract class BaseService {
  Future<dynamic> fetchRequest({required String path, Options? options});
  Future<dynamic> postRequest(
      {required String path, dynamic model, Options? options});
  dynamic returnResponse(Response response);
}
