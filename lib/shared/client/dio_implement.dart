import 'package:semana_api/shared/client/client.dart';
import 'package:semana_api/shared/client/response.dart';
import 'package:dio/dio.dart' as dio;


class DioClientImplement implements ApiClient {
  final dio.Dio dioInstance = dio.Dio();
  
  @override
  Future<Response> get({required String path}) async {
  
  final response = await dioInstance.get(path);
  return Response.fromDioResponse(response);
  
  }

  @override
  Future<Response> post({required String path, Map<String, dynamic>? body}) async {

    final response = await dioInstance.post(path, data: body);
    return Response.fromDioResponse(response);
    
  }


  
}