import 'package:semana_api/shared/client/client.dart';
import 'package:semana_api/shared/client/response.dart';
import 'package:dio/dio.dart' as dio;

class DioClientImpl extends ApiClient {
  final dio.Dio client;

  DioClientImpl({
    required this.client,
  });

  @override
  Future<Response> get({required String path}) async {
    final response = await client.get(path);
    return Response.fromDioResponse(response);
  }

  @override
  Future<Response> post(
      {required String path, Map<String, dynamic>? body}) async {
    final response = await client.post(path, data: body);
    return Response.fromDioResponse(response);
  }
}
