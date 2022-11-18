import 'package:semana_api/model/model.dart';
import 'package:semana_api/shared/client/client.dart';
import 'package:semana_api/shared/client/dio_implement.dart';
import 'package:semana_api/shared/app_configurations.dart';
import 'package:semana_api/shared/error/errors.dart';

class GetDataRepoService {
  final ApiClient client;

  GetDataRepoService({required this.client});

  Future<List<Person>> getData() async {
    final response = await client.get(path: AppConfigurations.mockUrl);
    switch (response.statusCode) {
      case 200:
        return List.from(response.data)
            .map((e) => Person.fromJson(e))
            .toList();

      case 403:
        throw ForbiddenException();

      case 404:
        throw NotFoundException();

      case 500:
        throw InternalServerException();

      default:
        throw UnknownEception();
    }
  }

  Future<List<Person>> postData({body}) async {
    final response =
        await client.post(path: AppConfigurations.mockUrl, body: body);
    switch (response.statusCode) {
      case 403:
        throw ForbiddenException();

      case 404:
        throw NotFoundException();

      case 500:
        throw InternalServerException();

      default:
        throw UnknownEception();
    }
  }
}
