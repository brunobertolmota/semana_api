import 'package:semana_api/shared/client/response.dart';

abstract class ApiClient {
  Future<Response> get({required String path});
  Future<Response> post({required String path, Map<String, dynamic>? body});
}
